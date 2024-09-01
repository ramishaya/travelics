part of 'reserve_cubit.dart';

abstract class ReserveState extends Equatable {
  const ReserveState();

  @override
  List<Object> get props => [];
}

class ReserveInitial extends ReserveState {}

class ReserveLoading extends ReserveState {}

class ReserveLoaded extends ReserveState {
  final Reserve reserve;

  const ReserveLoaded(this.reserve);

  @override
  List<Object> get props => [reserve];
}

class ReserveError extends ReserveState {
  final String errorMessage;

  const ReserveError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
