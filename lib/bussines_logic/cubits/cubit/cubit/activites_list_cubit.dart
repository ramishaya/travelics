import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tourism/data/repository/activites_list_repository.dart';

import '../../../../data/models/activites_list_model.dart';

part 'activites_list_state.dart';

class ActivitesListCubit extends Cubit<ActivitesListState> {
  final ActivitesListRepository activitesListRepository;
  ActivitesListCubit({required this.activitesListRepository}) : super(ActivitesListInitial());
  List<ActivitesListModel> activitesList = [];

  // List<ActivitesListModel> fetchActivitesList(String cityName) {
  //   activitesListRepository.fetchActivitesList(cityName).then((e) {
  //     emit(ActivitesListLoaded(e));
  //     activitesList = e;
  //   });
  //   print("we are in the cubit");
  //   print(activitesList[2].name);
  //   return activitesList;
  // }
  Future<List<ActivitesListModel>> fetchActivitesList(String cityName) async {
    try {
      final activitesList = await activitesListRepository.fetchActivitesList(cityName);
      emit(ActivitesListLoaded(activitesList));
      return activitesList;
    } catch (error) {
      emit(ActivitesListError("Error fetching activites: $error"));
      return []; // Return an empty list or handle the error case appropriately
    }
  }

  void clearActivitesList() {
    emit(ActivitesListInitial());
  }
}
