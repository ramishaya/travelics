import 'package:dio/dio.dart';

import 'dart:convert';



import '../models/weather2_model.dart';
import '../models/weather_model.dart';
class WeatherRepository{
  late Dio  dio ;
  static const baseUrl = "http://api.openweathermap.org/data/2.5/";
  static const apiKey = "c5424e43e0d1204e57f88e06b0287b1f";
  WeatherRepository(){
    BaseOptions options= BaseOptions(
      baseUrl: baseUrl,
      // headers:{
      //   'appid':apiKey,
      // },
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio=Dio(options);
  }
  Future<WeatherModel> getWeather(String city) async{
    final result= await dio.get('weather',queryParameters: {'q':city,'appid':apiKey,});
    if(result.statusCode!=200){
      throw Exception();
    }
// return parsedJson(result.data);
final main = result.data['main'];

    return WeatherModel(
      main['temp'],
      main['feels_like'],
      main['temp_min'],
      main['temp_max'],
      main['humidity'],
      main['pressure'],
    );
  }
  Future<Weather2Model> getWeather2(String city) async{
    final result= await dio.get('weather',queryParameters: {'q':city,'appid':apiKey,});
    if(result.statusCode!=200){
      throw Exception();
    }
// return parsedJson(result.data);
    final main2 = result.data['weather'][0];

    return Weather2Model(
      main2['id'],
      main2['main'],
      main2['description'],
      main2['icon'],

    );
  }

  // WeatherModel parsedJson(final response) {
  //   final jsonDecoded = jsonDecode(response);
  //   return WeatherModel.fromJson(jsonDecoded['main']);
  // }
  // WeatherModel parsedJson(final response) {
  //   final jsonDecoded = jsonDecode(response);
  //   return WeatherModel.fromJson(jsonDecoded);
  // }
  WeatherModel parsedJson(final response) {
    final jsonDecoded = json.decode(response.toString());
    return WeatherModel.fromJson(jsonDecoded["main"]);
  }
}