import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tourism/data/models/rest_list_model.dart';
import 'package:tourism/data/repository/rest_list_repository.dart';

part 'rest_list_state.dart';

class RestListCubit extends Cubit<RestListState> {
  RestListRepository restListRepository;
  RestListCubit({required this.restListRepository}) : super(RestListInitial());
  List<RestListModel> restList = [];

  List<RestListModel> fetchRestList(String cityName) {
    restListRepository.fetchRestList(cityName).then((e) {
      emit(RestListLoaded(e));
      restList = e;
    });
    print("we are in the cubit of the restaurants");
    print(restList);
    return restList;
  }

  void clearRestList() {
    emit(RestListInitial());
  }
}

