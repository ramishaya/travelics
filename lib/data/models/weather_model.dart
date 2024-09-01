import 'package:flutter/foundation.dart';

class WeatherModel{
  final temp;
  final feelsLike;
  final tempMin;
  final tempMax;
  final presssure;
  final humidity;



  WeatherModel(this.temp, this.feelsLike, this.tempMin, this.tempMax, this.presssure, this.humidity );

  double get getTemp =>temp!-272.5;
  double get getTempMax =>tempMax!-272.5;
  double get getTempMin =>tempMin!-272.5;
  int get getPressure =>presssure!;
  double get getFeelsLike =>feelsLike!-272.5;
  int get getHumidity =>humidity!;

  factory WeatherModel.fromJson(Map<String,dynamic>json){
    // temp=json['temp'];
    // feelsLike=json['feels_like'];
    // tempMin=json['temp_min'];
    // tempMax=json['temp_max'];
    // presssure=json['pressure'];
    // humidity=json['humidity'];
    return WeatherModel(
        json["main"]["temp"],
        json["main"]['feels_like'],
        json["main"]['temp_min'],
        json["main"]['temp_max'],
        json["main"]['pressure'],
        json["main"]['humidity'],


    );



  }




}