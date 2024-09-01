part of 'city_guide_cubit.dart';


abstract class CityGuideState extends Equatable {
  const CityGuideState();

  @override
  List<Object> get props => [];
}

class CityGuideInitial extends CityGuideState {}

class CityGuideLoading extends CityGuideState {}

class CityGuideLoaded extends CityGuideState {
  final List<CityGuide> cityGuideList;

   CityGuideLoaded(this.cityGuideList);

  @override
  List<Object> get props => [cityGuideList];
}

class CityGuideError extends CityGuideState {
  final String message;

  CityGuideError(this.message);

  @override
  List<Object> get props => [message];
}