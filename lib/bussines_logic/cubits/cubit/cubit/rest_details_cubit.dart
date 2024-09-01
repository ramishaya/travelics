import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tourism/data/repository/rest_details_repository.dart';

import '../../../../data/models/rest_details_model.dart';

part 'rest_details_state.dart';

class RestDetailsCubit extends Cubit<RestDetailsState> {
  RestDetailsRepository restDetailsRepository;
  RestDetailsCubit({required this.restDetailsRepository}) : super(RestDetailsInitial());

  Future<void> fetchRestDetails(String restName) async {
    try {
      emit(RestDetailsLoading());

      final restDetails = await restDetailsRepository.fetchRestDetails(restName);
      emit(RestDetailsLoaded(restDetails));
    } catch (e) { 
      emit(RestDetailsError(e.toString()));
    }
  }
  void reset() {
    emit(RestDetailsInitial());
  }
}

