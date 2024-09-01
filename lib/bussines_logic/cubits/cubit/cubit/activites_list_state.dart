part of 'activites_list_cubit.dart';

abstract class ActivitesListState extends Equatable {
  const ActivitesListState();

  @override
  List<Object> get props => [];
}

class ActivitesListInitial extends ActivitesListState {}

class ActivitesListLoading extends ActivitesListState {}

class ActivitesListLoaded extends ActivitesListState {
  final List<ActivitesListModel> activitesList;

  ActivitesListLoaded(this.activitesList);

  @override
  List<Object> get props => [activitesList];
}

class ActivitesListError extends ActivitesListState {
  final String message;

  ActivitesListError(this.message);

  @override
  List<Object> get props => [message];
}
