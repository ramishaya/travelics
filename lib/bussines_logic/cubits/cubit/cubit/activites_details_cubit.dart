import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tourism/data/repository/activites_details_repository.dart';

import '../../../../data/models/activites_details_model.dart';

part 'activites_details_state.dart';

class ActivitesDetailsCubit extends Cubit<ActivitesDetailsState> {
  final ActivitesDetailsRepository activitesDetailsRepository;
  ActivitesDetailsCubit({required this.activitesDetailsRepository}) : super(ActivitesDetailsInitial());


  Future<void> fetchActivitesDetails(String activitesName) async {
    try {
      emit(ActivitesDetailsLoading());

      final activitesDetails = await activitesDetailsRepository.fetchActivitesDetails(activitesName);
      emit(ActivitesDetailsLoaded(activitesDetails));
    } catch (e) { 
      emit(ActivitesDetailsError(e.toString()));
    }
  }
  void reset() {
    emit(ActivitesDetailsInitial());
  }
}



