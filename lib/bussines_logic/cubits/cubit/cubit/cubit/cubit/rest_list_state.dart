part of 'rest_list_cubit.dart';

abstract class RestListState extends Equatable {
  const RestListState();

  @override
  List<Object> get props => [];
}

class RestListInitial extends RestListState {}

class RestListLoading extends RestListState {}

class RestListLoaded extends RestListState {
  final List<RestListModel> restList;

  RestListLoaded(this.restList);

  @override
  List<Object> get props => [restList];
}

class RestListError extends RestListState {
  final String message;

  RestListError(this.message);

  @override
  List<Object> get props => [message];
}
