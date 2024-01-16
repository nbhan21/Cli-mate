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
          margin: EdgeInsets.only(bottom: 10, top: 10),
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
                fillColor: const Color.fromARGB(255, 255, 255, 255),
                filled: true,
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                suffixIcon: IconButton(
                  onPressed: () {
                    _getWeather(_textController.text);
                  },
                  icon: Icon(Icons.search),
                ),
              ),
            ),
          ),
        ),

         // Add the horizontal scroll content under 'Search City'
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Container(
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                      ),
                      child: Center(
                        child: Text('lisview 1')
                      ),
                    ),
                  ),
                  ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Container(
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                      ),
                      child: Center(
                        child: Text(
                          'ListView 1',
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  ),
                  ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Container(
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                      ),
                      child: Center(
                        child: Text(
                          'ListView 1',
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  ),
                  ),
              ],
            ),
          ),
        ),
        
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        toolbarHeight: 150,
        backgroundColor: const Color.fromARGB(255, 42, 105, 45),
        elevation: 10,

      ),
      body: _buildUI(),
    );
  }

  // body: const Column(
  //   mainAxisAlignment: MainAxisAlignment.center,
  //   children: [
  //     Center( //ini nanti diganti lagi
  //       //padding: EdgeInsets.symmetric(horizontal: 25.0),
  //       child: Text('Coming Soon',
  //       textAlign: TextAlign.center,
  //       style: TextStyle(
  //         fontFamily: 'PlusJakartaSans',
  //         fontSize: 28,
  //         fontWeight: FontWeight.w700),
  //       ),
  //     ),
  //   ]
  // )

  Widget _buildUI() {
    if (_weather == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _temperatureIndicator(),
          SizedBox(height: 10),
          _rainfallIndicator(),
          SizedBox(height: 10),
          _extremeWeatherIndicator(),
          SizedBox(height: 10),
          _healthRiskIndicator(),
          SizedBox(height: 10),
          
          _dateTimeInfo(),
          SizedBox(height: 10),
          _weatherIcon(),
          SizedBox(height: 10),
          _currentTemp(),
          SizedBox(height: 10),
          _extraInfo(),
        ],
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
        27; // average temperature jakarta bulan januari - februari (demo)
    double averageTemperaturePanas =
        29; //average temperature jakarta bulan maret - desember (demo)

    if (bulanInt <= 2) {
      if (currentTemperatureAvg <= averageTemperatureDingin) {
        return Text('Suhu stabil');
      } else {
        return Text('Suhu naik');
      }
    } else if (bulanInt > 2) {
      if (currentTemperatureAvg <= averageTemperaturePanas) {
        return Text('Suhu stabil');
      } else {
        return Text('Suhu naik');
      }
    } else
      return Text("");

    // if (currentTemperatureAvg > averageTemperature){
    //   return Text('Suhu naik');
    // } else{
    //   return Text('Suhu turun');
    // }
  }

  Widget _rainfallIndicator() {
    // double? currentRainfall = _weather?.;
    // return Text(currentRainfall.toString());
    double currentRainfall = 500; // data untuk demo
    double averageRainfall = 100; // data untuk demo

    if (currentRainfall < averageRainfall) {
      return Text("");
    } else {
      return Text('Peningkatan curah hujan');
    }
  }

  Widget _extremeWeatherIndicator() {
    String? currentWeather = _weather?.weatherMain;

    if (currentWeather.toString().toLowerCase().contains('thunderstorm') ||
        currentWeather.toString().toLowerCase().contains('storm')) {
      return Text('Cuaca Ekstrim');
    } else {
      return Text("");
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
          currentWeather.toString().toLowerCase().contains('rain')) {
        return Text('Peningkatan resiko penyakit');
      } else {
        return Text("");
      }
    } else if (bulanInt > 2) {
      if (currentTemperatureAvg > maxTempPanas &&
          currentWeather.toString().toLowerCase().contains('rain')) {
        return Text('Peningkatan resiko penyakit');
      } else {
        return Text("");
      }
    } else
      return Text("");
  }

  Widget _locationHeader() {
    DateTime now = _weather!.date!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          _weather?.areaName ?? "",
          style: TextStyle(
            fontFamily: 'PlusJakartaFont',
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          DateFormat("h:mm a").format(now),
          style: TextStyle(
            fontFamily: 'PlusJakartaFont',
            fontSize: 20,
            // fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _dateTimeInfo() {
    DateTime now = _weather!.date!;
    return Column(
      children: [
        Text(
          DateFormat("h:mm a").format(now),
          style: TextStyle(
            fontFamily: 'PlusJakartaFont',
            fontSize: 35,
            // fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "  ${DateFormat("d.M.y").format(now)}",
              style: TextStyle(
                fontFamily: 'PlusJakartaFont',
                // fontSize: 35,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _weatherIcon() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height * 0.20,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "http://openweathermap.org/img/wn/${_weather?.weatherIcon}@4x.png"))),
        ),
        Text(
          _weather?.weatherDescription ?? "",
          style: TextStyle(
            fontFamily: 'PlusJakartaFont',
            // fontSize: 35,
            // fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }

  Widget _currentTemp() {
    return Text(
      "${_weather?.temperature?.celsius?.toStringAsFixed(0)}° C",
      style: TextStyle(
        color: Colors.black,
        fontFamily: 'PlusJakartaFont',
        fontSize: 90,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _extraInfo() {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.80,
      height: MediaQuery.sizeOf(context).height * 0.15,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 42, 105, 45),
          borderRadius: BorderRadius.circular(10)),
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
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'PlusJakartaFont',
                  fontSize: 15,
                ),
              ),
              Text(
                "Min: ${_weather?.tempMin?.celsius?.toStringAsFixed(0)}° C",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'PlusJakartaFont',
                  fontSize: 15,
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
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'PlusJakartaFont',
                  fontSize: 15,
                ),
              ),
              Text(
                "Humidity: ${_weather?.humidity?.toStringAsFixed(0)}%",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'PlusJakartaFont',
                  fontSize: 15,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
