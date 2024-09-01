// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/hotels_list_model.dart';
import '../../../data/repository/hotels_list_repository.dart';

part 'hotels_list_state.dart';

class HotelsListCubit extends Cubit<HotelsListState> {
  final HotelsListRepository hotelsListRepository;

  HotelsListCubit({required this.hotelsListRepository})
      : super(HotelsListInitial());
  List<HotelsListModel> hotelsList = [];

  List<HotelsListModel> fetchHotelsList(String cityName) {
    hotelsListRepository.fetchHotelsList(cityName).then((e) {
      emit(HotelsListLoaded(e));
      hotelsList = e;
    });
    print("we are in the cubit");
    print(hotelsList);
    return hotelsList;
  }

  void clearHotelsList() {
    emit(HotelsListInitial());
  }
}
