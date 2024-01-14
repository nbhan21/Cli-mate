import 'dart:convert';

import 'package:climate/Pages/page%20components/weather_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class weatherService{
  static const BASE_URL = 'http://api.openweathermap.org/data/2.5/weather';
  final String apiKey;

  weatherService(this.apiKey);

  Future<Weather> getWeather (String cityName) async{
    final response = await http.get(Uri.parse('$BASE_URL?q=$cityName&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<String> getCurrentCity() async{

    // mendapatkan location permission
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied){
      permission == await Geolocator.requestPermission();
    }

    // fetch current location
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.medium
    );

    // convert location menjadi placemark objects
    List<Placemark> placemarks = 
    await placemarkFromCoordinates(position.latitude, position.longitude);

    // mengekstrak placemark mennjadi city name
    String? city = placemarks[0].locality;
    return city ?? "";
  }

}