part of 'offers_cubit.dart';



abstract class OffersState extends Equatable {
  const OffersState();

  @override
  List<Object> get props => [];
}

class OffersInitial extends OffersState {}

class OffersLoading extends OffersState {}

class OffersLoaded extends OffersState {
  final List<dynamic> offersList;

   OffersLoaded(this.offersList);

  @override
  List<Object> get props => [offersList];
}

class OffersError extends OffersState {
  final String message;

  OffersError(this.message);

  @override
  List<Object> get props => [message];
}
