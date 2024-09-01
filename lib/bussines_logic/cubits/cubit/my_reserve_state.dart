// my_reserve_state.dart

import '../../../data/models/my_reserve.dart';

abstract class MyReserveState {}

class MyReserveInitial extends MyReserveState {}

class MyReserveLoading extends MyReserveState {}

class MyReserveLoaded extends MyReserveState {
  final List<dynamic> hotels;

  MyReserveLoaded({required this.hotels});
}

class MyReserveError extends MyReserveState {
  final String message;

  MyReserveError({required this.message});
}