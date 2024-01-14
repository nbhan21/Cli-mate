import 'package:climate/Pages/page%20components/weather_model.dart';
import 'package:climate/Pages/page%20components/weather_service.dart';
import 'package:flutter/material.dart';

class pageClimate extends StatefulWidget {
  const pageClimate({super.key});

  @override
  State<pageClimate> createState() => _pageClimateState();
}

class _pageClimateState extends State<pageClimate> {

  // apiKey
  final _weatherService = weatherService('6fb07033bae6d970302576a144b5b2f9');
  Weather? _weather;


  // fetch weather
  _fetchWeather() async{
    // kota
    String cityName = await _weatherService.getCurrentCity();

    // weather kota
    try{
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });

    }

    // jika ada error
    catch(e){
      print(e);
    }
  }

  // weather animation

  // state awal
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 232, 238),
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,  
      //    shape: const RoundedRectangleBorder(
      //       borderRadius: BorderRadius.only(
      //         bottomLeft: Radius.circular(10), 
      //         bottomRight: Radius.circular(10),)
      //     ),
      //   toolbarHeight: 75,
      //   backgroundColor: const Color.fromARGB(255, 42, 105, 45),
      //   elevation: 10,
      //   // shadowColor: Colors.transparent,
      // ),

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

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Kota
            Text(_weather?.cityName ?? "loading city.."),
      
      
            // Temperatur
            Text('${_weather?.temperature.round()}°C')
          ]),
      ),
      
    
    );
  }
}