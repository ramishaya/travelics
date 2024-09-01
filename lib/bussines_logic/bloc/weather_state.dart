part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherIsNotSearched extends WeatherState{

}
class WeatherIsLoaded extends WeatherState {
  final WeatherModel weatherLoaded;
  final Weather2Model weather2model;

  WeatherIsLoaded(this.weatherLoaded,this.weather2model);

  WeatherModel get getWeather => weatherLoaded;
  Weather2Model get get2Weather => weather2model;
}
class WeatherIsLoading extends WeatherState{


}

class WeatherIsNotLoaded extends WeatherState{

}

