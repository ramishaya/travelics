import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/hotels_details_model.dart';
import '../../../data/repository/hotels_details_repository.dart';

part 'hotels_details_state.dart';

class HotelsDetailsCubit extends Cubit<HotelsDetailsState> {
  final HotelsDetailsRepository repository;

  HotelsDetailsCubit(this.repository) : super(HotelsDetailsInitial());

  Future<void> fetchHotelDetails(String hotelName) async {
    try {
      emit(HotelsDetailsLoading());

      final hotelDetails = await repository.fetchHotelsDetails(hotelName);
      emit(HotelsDetailsLoaded(hotelDetails));
    } catch (e) { 
      emit(HotelsDetailsError(e.toString()));
    }
  }
  void reset() {
    emit(HotelsDetailsInitial());
  }
}
