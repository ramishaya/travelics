part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent  {}

class FetchWeather extends WeatherEvent{
 final city;

  FetchWeather(this.city);

}
class ResetWeather extends WeatherEvent{

}
