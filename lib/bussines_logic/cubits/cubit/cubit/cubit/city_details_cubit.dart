import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tourism/data/repository/city_details_repository.dart';

import '../../../../../data/models/city_details_model.dart';

part 'city_details_state.dart';

class CityDetailsCubit extends Cubit<CityDetailsState> {
  CityDetailsRepository cityDetailsRepository;
  CityDetailsCubit({required this.cityDetailsRepository})
      : super(CityDetailsInitial());

  Future<void> fetchCityDetails(String cityName) async {
    try {
      emit(CityDetailsLoading());

      final cityDetails =
          await cityDetailsRepository.fetchCityDetails(cityName);
      print(cityDetails.description);
      emit(CityDetailsLoaded(cityDetails));
    } catch (e) {
      emit(CityDetailsError(e.toString()));
    }
  }

  void reset() {
    emit(CityDetailsInitial());
  }
}
