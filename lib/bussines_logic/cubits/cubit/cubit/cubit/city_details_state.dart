part of 'city_details_cubit.dart';

abstract class CityDetailsState extends Equatable {
  const CityDetailsState();

  @override
  List<Object> get props => [];
}

class CityDetailsInitial extends CityDetailsState {}

class CityDetailsLoading extends CityDetailsState {}

class CityDetailsLoaded extends CityDetailsState {
  final CityDetailsModel cityDetails;

  const CityDetailsLoaded(this.cityDetails);

  @override
  List<Object> get props => [cityDetails];
}

class CityDetailsError extends CityDetailsState {
  final String errorMessage;

  const CityDetailsError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
