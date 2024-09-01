import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


import '../../data/models/weather2_model.dart';
import '../../data/models/weather_model.dart';
import '../../data/repository/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';


class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherRepository weatherRepo;
  
  WeatherBloc(this.weatherRepo) : super(WeatherIsNotSearched()) {
        
    on<FetchWeather>((event, emit) async {
      emit(WeatherIsLoading()) ;
      try {
        WeatherModel weather = await weatherRepo.getWeather(event.city);
        Weather2Model weather2 = await weatherRepo.getWeather2(event.city);
       emit(WeatherIsLoaded(weather,weather2));
      } catch (e) {
        print(e.toString());
        emit(WeatherIsNotLoaded()) ;
      }
    });

    on<ResetWeather>((event, emit)  {
      emit(WeatherIsNotSearched());
    });
  }
}


