import 'package:climate/Pages/climate%20page%20components/disease.dart';
import 'package:climate/Pages/climate%20page%20components/extreme_weather.dart';
import 'package:climate/Pages/climate%20page%20components/humidity.dart';
import 'package:climate/Pages/climate%20page%20components/temperature.dart';
import 'package:climate/Pages/page%20components/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

class pageClimate extends StatefulWidget {
  pageClimate({super.key});

  @override
  State<pageClimate> createState() => _pageClimateState();
}

class _pageClimateState extends State<pageClimate> {
  final WeatherFactory _wf = WeatherFactory(OPENWEATHER_API_KEY);
  Weather? _weather;
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _getWeather("Jakarta"); // Default city
  }

  // Function to get weather data based on city name
  Future<void> _getWeather(String city) async {
    try {
      Weather weather = await _wf.currentWeatherByCityName(city);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print("Error fetching weather data: $e");
      // Handle error as needed (show a message to the user, etc.)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 232, 238),
      appBar: AppBar(
        automaticallyImplyLeading: false,

        // Search Bar
        title: Container(
          margin: const EdgeInsets.only(bottom: 10, top: 10),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 232, 232, 238),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 42, 105, 45),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Search City',
                hintStyle: const TextStyle(fontFamily: 'PlusJakartaSans'),
                fillColor: const Color.fromARGB(255, 255, 255, 255),
                filled: true,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                suffixIcon: IconButton(
                  onPressed: () {
                    _getWeather(_textController.text);
                  },
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
        ),

        // Add the horizontal scroll content under 'Search City'

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            margin: const EdgeInsets.only(bottom: 20),
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                // Location Info
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Container(
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 53, 129, 56),
                      ),
                      child: Center(
                        child: _locationHeader(),
                      ),
                    ),
                  ),
                ),

                // weather info
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Container(
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 53, 129, 56),
                      ),
                      child: Center(
                        child: _weatherIcon(),
                      ),
                    ),
                  ),
                ),

                // extra info
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Container(
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 53, 129, 56),
                      ),
                      child: Center(
                        child: _extraInfo(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        toolbarHeight: 150,
        backgroundColor: const Color.fromARGB(255, 42, 105, 45),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 323,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 42, 105, 45),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            child: _buildUI(),
          ),
        ],
      ),
    );
  }

  Widget _buildUI() {
    if (_weather == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 53, 129, 56),
          borderRadius: BorderRadius.circular(20)),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _temperatureIndicator(),
            _extremeWeatherIndicator(),
            _healthRiskIndicator(),
            _highHumidityIndicator(),
            const SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }

  Widget _temperatureIndicator() {
    DateTime now = _weather!.date!;
    String bulan = DateFormat("M").format(now);
    int bulanInt = int.parse(bulan);
    double? currentTemperatureMax = _weather?.tempMax?.celsius;
    double? currentTemperatureMin = _weather?.tempMin?.celsius;
    double currentTemperatureAvg =
        (currentTemperatureMin! + currentTemperatureMax!) / 2;
    double averageTemperatureDingin =
        20; // average temperature jakarta bulan januari - februari (demo) // nanti ganti jadi 27
    double averageTemperaturePanas =
        28; //average temperature jakarta bulan maret - desember (demo)

    if (bulanInt <= 2) {
      if (currentTemperatureAvg < averageTemperatureDingin) {
        return Container();
      } else {
        return Column(
          children: [
            // SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const tempPage()));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  // vertical: 20,
                ),
                // color: Color.fromARGB(255, 53, 129, 56),
                height: 160,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Container(
                      height: 136,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: const Color.fromARGB(255, 232, 232, 238),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(76, 0, 0, 0),
                              offset: Offset(
                                5.0,
                                5.0,
                              ),
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                            )
                          ]),
                    ),
                    Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 62),
                          width: 100,
                          height: 160,
                          child: const Icon(
                            CupertinoIcons.thermometer_sun,
                            color: Color.fromARGB(255, 0, 71, 2),
                            size: 60,
                          ),
                        )),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        child: SizedBox(
                          height: 135,
                          width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Spacer(),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "Temperature is Abnormal",
                                  style: TextStyle(
                                    fontFamily: 'PlusJakartaSans',
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 0, 71, 2),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(22),
                                        topRight: Radius.circular(22))),
                                child: const Text(
                                  "See Details",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'PlusJakartaSans',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ],
        );
      }
    } else if (bulanInt > 2) {
      if (currentTemperatureAvg < averageTemperaturePanas) {
        return Container();
      } else {
        return Column(
          children: [
            // SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const tempPage()));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  // vertical: 20,
                ),
                // color: Color.fromARGB(255, 53, 129, 56),
                height: 160,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Container(
                      height: 136,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: const Color.fromARGB(255, 232, 232, 238),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(76, 0, 0, 0),
                              offset: Offset(
                                5.0,
                                5.0,
                              ),
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                            )
                          ]),
                    ),
                    Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 62),
                          width: 100,
                          height: 160,
                          child: const Icon(
                            CupertinoIcons.thermometer_sun,
                            color: Color.fromARGB(255, 0, 71, 2),
                            size: 60,
                          ),
                        )),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        child: SizedBox(
                          height: 135,
                          width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Spacer(),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "Temperature is Abnormal",
                                  style: TextStyle(
                                    fontFamily: 'PlusJakartaSans',
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 0, 71, 2),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(22),
                                        topRight: Radius.circular(22))),
                                child: const Text(
                                  "See Details",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'PlusJakartaSans',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ],
        );
      }
    } else
      return Container();
  }

  Widget _extremeWeatherIndicator() {
    String? currentWeather = _weather?.weatherMain;

    if (currentWeather.toString().toLowerCase().contains('thunderstorm') ||
        currentWeather.toString().toLowerCase().contains('storm') ||
        currentWeather.toString().toLowerCase().contains('clouds')
        ) {
          // nanti ganti jadi storm
      return Column(
          children: [
            // SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const extremeWeather()));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  // vertical: 20,
                ),
                // color: Color.fromARGB(255, 53, 129, 56),
                height: 160,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Container(
                      height: 136,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: const Color.fromARGB(255, 232, 232, 238),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(76, 0, 0, 0),
                              offset: Offset(
                                5.0,
                                5.0,
                              ),
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                            )
                          ]),
                    ),
                    Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 62),
                          width: 100,
                          height: 160,
                          child: const Icon(
                            CupertinoIcons.cloud_sun_rain,
                            color: Color.fromARGB(255, 0, 71, 2),
                            size: 60,
                          ),
                        )),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        child: SizedBox(
                          height: 135,
                          width: 250,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Spacer(),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "On-Going Extreme Weather",
                                  style: TextStyle(
                                    fontFamily: 'PlusJakartaSans',
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 0, 71, 2),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(22),
                                        topRight: Radius.circular(22))),
                                child: const Text(
                                  "See Details",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'PlusJakartaSans',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ],
        );
    } else {
      return Container();
    }
  }

  Widget _healthRiskIndicator() {
    DateTime now = _weather!.date!;
    String bulan = DateFormat("M").format(now);
    int bulanInt = int.parse(bulan);
    double? currentTemperatureMax = _weather?.tempMax?.celsius;
    double? currentTemperatureMin = _weather?.tempMin?.celsius;
    double currentTemperatureAvg =
        (currentTemperatureMin! + currentTemperatureMax!) / 2;
    double maxTempPanas = 32; //data untuk demo
    double maxTempDingin = 30; //data untuk demo
    String? currentWeather = _weather?.weatherMain;

    if (bulanInt <= 2) {
      if (currentTemperatureAvg > maxTempDingin &&
          currentWeather.toString().toLowerCase().contains('rain') ||
            currentWeather.toString().toLowerCase().contains('haze') ||
            currentWeather.toString().toLowerCase().contains('clouds')) {
                // nanti ganti jadi storm, hapus clouds
        return Column(
          children: [
            // SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const disease()));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  // vertical: 20,
                ),
                // color: Color.fromARGB(255, 53, 129, 56),
                height: 160,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Container(
                      height: 136,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: const Color.fromARGB(255, 232, 232, 238),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(76, 0, 0, 0),
                              offset: Offset(
                                5.0,
                                5.0,
                              ),
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                            )
                          ]),
                    ),
                    Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 62),
                          width: 100,
                          height: 160,
                          child: const Icon(
                            CupertinoIcons.heart_slash,
                            color: Color.fromARGB(255, 0, 71, 2),
                            size: 60,
                          ),
                        )),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        child: SizedBox(
                          height: 135,
                          width: 250,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Spacer(),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "Increasing Risk of Diseases",
                                  style: TextStyle(
                                    fontFamily: 'PlusJakartaSans',
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 0, 71, 2),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(22),
                                        topRight: Radius.circular(22))),
                                child: const Text(
                                  "See Details",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'PlusJakartaSans',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ],
        );
      } else {
        return Container();
      }
    } else if (bulanInt > 2) {
      if (currentTemperatureAvg > maxTempPanas &&
          currentWeather.toString().toLowerCase().contains('rain') ||
              currentWeather.toString().toLowerCase().contains('storm')) {
        return Column(
          children: [
            // SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const disease()));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  // vertical: 20,
                ),
                // color: Color.fromARGB(255, 53, 129, 56),
                height: 160,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Container(
                      height: 136,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: const Color.fromARGB(255, 232, 232, 238),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(76, 0, 0, 0),
                              offset: Offset(
                                5.0,
                                5.0,
                              ),
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                            )
                          ]),
                    ),
                    Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 62),
                          width: 100,
                          height: 160,
                          child: const Icon(
                            CupertinoIcons.heart_slash,
                            color: Color.fromARGB(255, 0, 71, 2),
                            size: 60,
                          ),
                        )),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        child: SizedBox(
                          height: 135,
                          width: 250,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Spacer(),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "Increasing Risk of Diseases",
                                  style: TextStyle(
                                    fontFamily: 'PlusJakartaSans',
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 0, 71, 2),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(22),
                                        topRight: Radius.circular(22))),
                                child: const Text(
                                  "See Details",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'PlusJakartaSans',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ],
        );
      } else {
        return Container();
      }
    } else
      return Container();
  }

  Widget _highHumidityIndicator() {
    double? currentHumidity = _weather?.humidity;

    if (currentHumidity! > 50) { // nanti ganti jadi 80
      return Column(
          children: [
            // SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const humidity()));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  // vertical: 20,
                ),
                // color: Color.fromARGB(255, 53, 129, 56),
                height: 160,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Container(
                      height: 136,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: const Color.fromARGB(255, 232, 232, 238),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(76, 0, 0, 0),
                              offset: Offset(
                                5.0,
                                5.0,
                              ),
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                            )
                          ]),
                    ),
                    Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 62),
                          width: 100,
                          height: 160,
                          child: const Icon(
                            Icons.air,
                            color: Color.fromARGB(255, 0, 71, 2),
                            size: 60,
                          ),
                        )),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        child: SizedBox(
                          height: 135,
                          width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Spacer(),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "Unsafe Level of Humidity",
                                  style: TextStyle(
                                    fontFamily: 'PlusJakartaSans',
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 0, 71, 2),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(22),
                                        topRight: Radius.circular(22))),
                                child: const Text(
                                  "See Details",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'PlusJakartaSans',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ],
        );
    } else {
      return Container();
    }
  }

  Widget _locationHeader() {
    if (_weather == null) {
      return const Text("");
    }
    DateTime now = _weather!.date!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          _weather?.areaName ?? "",
          style: const TextStyle(
            fontFamily: 'PlusJakartaSans',
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        Text(
          DateFormat("h:mm a").format(now),
          style: const TextStyle(
            fontFamily: 'PlusJakartaSans',
            fontSize: 20,
            color: Colors.white,
            // fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  // Widget _dateTimeInfo() {
  //   if (_weather == null) {
  //     return Text("");
  //   }
  //   DateTime now = _weather!.date!;
  //   return Column(
  //     children: [
  //       Text(
  //         DateFormat("h:mm a").format(now),
  //         style: TextStyle(
  //           fontFamily: 'PlusJakartaFont',
  //           fontSize: 35,
  //           // fontWeight: FontWeight.w500,
  //         ),
  //       ),
  //       const SizedBox(
  //         height: 10,
  //       ),
  //       Row(
  //         mainAxisSize: MainAxisSize.max,
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //           Text(
  //             "  ${DateFormat("d.M.y").format(now)}",
  //             style: TextStyle(
  //               fontFamily: 'PlusJakartaFont',
  //               // fontSize: 35,
  //               fontWeight: FontWeight.w400,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ],
  //   );
  // }

  Widget _weatherIcon() {
    if (_weather == null) {
      return const Text("");
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "${_weather?.temperature?.celsius?.toStringAsFixed(0)}° C",
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'PlusJakartaSans',
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              height: MediaQuery.sizeOf(context).height * 0.06,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "http://openweathermap.org/img/wn/${_weather?.weatherIcon}@4x.png"))),
            ),
            Container(
              child: Text(
                _weather?.weatherDescription ?? "",
                style: const TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  color: Colors.white,
                  fontSize: 10,
                  // fontSize: 35,
                  // fontWeight: FontWeight.w700,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  // Widget _currentTemp() {
  //   if (_weather == null) {
  //     return Text("");
  //   }
  //   return Text(
  //     "${_weather?.temperature?.celsius?.toStringAsFixed(0)}° C",
  //     style: TextStyle(
  //       color: Colors.black,
  //       fontFamily: 'PlusJakartaFont',
  //       fontSize: 90,
  //       fontWeight: FontWeight.w500,
  //     ),
  //   );
  // }

  Widget _extraInfo() {
    if (_weather == null) {
      return const Text("");
    }
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.80,
      height: MediaQuery.sizeOf(context).height * 0.15,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Max: ${_weather?.tempMax?.celsius?.toStringAsFixed(0)}° C",
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'PlusJakartaSans',
                  fontSize: 13,
                ),
              ),
              Text(
                "Min: ${_weather?.tempMin?.celsius?.toStringAsFixed(0)}° C",
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'PlusJakartaSans',
                  fontSize: 13,
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Wind: ${_weather?.windSpeed?.toStringAsFixed(0)}m/s",
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'PlusJakartaSans',
                  fontSize: 12,
                ),
              ),
              Text(
                "Humidity: ${_weather?.humidity?.toStringAsFixed(0)}%",
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'PlusJakartaSans',
                  fontSize: 12,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
