part of 'activites_details_cubit.dart';

abstract class ActivitesDetailsState extends Equatable {
  const ActivitesDetailsState();

  @override
  List<Object> get props => [];
}

class ActivitesDetailsInitial extends ActivitesDetailsState {}

class ActivitesDetailsLoading extends ActivitesDetailsState {}

class ActivitesDetailsLoaded extends ActivitesDetailsState {
  final ActivitesDetailsModel activitesDetails;

  const ActivitesDetailsLoaded(this.activitesDetails);

  @override
  List<Object> get props => [activitesDetails];
}

class ActivitesDetailsError extends ActivitesDetailsState {
  final String errorMessage;

  const ActivitesDetailsError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
