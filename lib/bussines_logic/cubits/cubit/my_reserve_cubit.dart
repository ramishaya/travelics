import 'package:bloc/bloc.dart';

import '../../../data/repository/my_reserve_repository.dart';
import 'my_reserve_state.dart';

class MyReserveCubit extends Cubit<MyReserveState> {
  final MyReserveRepository myReserveRepository;

  MyReserveCubit({required this.myReserveRepository})
      : super(MyReserveInitial());

  void fetchMyReserve() async {
    emit(MyReserveLoading());

    try {
      final hotels = await myReserveRepository.fetchMyReserveList();
      emit(MyReserveLoaded(hotels: hotels));
      print("emit in reserve succesful");
    } catch (e) {
      print("error in reserve cubit");
      emit(MyReserveError(message: e.toString()));
    }
  }
}
