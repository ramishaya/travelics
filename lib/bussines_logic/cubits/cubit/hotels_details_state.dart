part of 'hotels_details_cubit.dart';

abstract class HotelsDetailsState extends Equatable {
  const HotelsDetailsState();

  @override
  List<Object> get props => [];
}

class HotelsDetailsInitial extends HotelsDetailsState {}

class HotelsDetailsLoading extends HotelsDetailsState {}

class HotelsDetailsLoaded extends HotelsDetailsState {
  final HotelsDetailsModel hotelDetails;

  const HotelsDetailsLoaded(this.hotelDetails);

  @override
  List<Object> get props => [hotelDetails];
}

class HotelsDetailsError extends HotelsDetailsState {
  final String errorMessage;

  const HotelsDetailsError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
