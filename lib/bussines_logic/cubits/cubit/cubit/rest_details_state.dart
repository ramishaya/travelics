part of 'rest_details_cubit.dart';


abstract class RestDetailsState extends Equatable {
  const RestDetailsState();

  @override
  List<Object> get props => [];
}

class RestDetailsInitial extends RestDetailsState {}

class RestDetailsLoading extends RestDetailsState {}

class RestDetailsLoaded extends RestDetailsState {
  final RestDetailsModel restDetails;

  const RestDetailsLoaded(this.restDetails);

  @override
  List<Object> get props => [restDetails];
}

class RestDetailsError extends RestDetailsState {
  final String errorMessage;

  const RestDetailsError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}