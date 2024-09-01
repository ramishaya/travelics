import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tourism/data/repository/resrve_repository.dart';

import '../../../../data/models/reserve_model.dart';

part 'reserve_state.dart';

class ReserveCubit extends Cubit<ReserveState> {
  ReserveRepository reserveRepository;
  ReserveCubit({required this.reserveRepository}) : super(ReserveInitial());

  Future<void> makeReserve(
      String email, int password, int roomId, int duration) async {
    try {
      emit(ReserveLoading());

      final resereveResponse = await reserveRepository.makeReserve(
          email, password, roomId, duration);
      emit(ReserveLoaded(resereveResponse));
    } catch (e) {
      emit(ReserveError(e.toString()));
    }
  }

  void reset() {
    emit(ReserveInitial());
  }
}
