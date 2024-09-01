part of 'hotels_list_cubit.dart';

abstract class HotelsListState extends Equatable {
  const HotelsListState();

  @override
  List<Object> get props => [];
}

class HotelsListInitial extends HotelsListState {}

class HotelsListLoading extends HotelsListState {}

class HotelsListLoaded extends HotelsListState {
  final List<HotelsListModel> hotelsList;

  HotelsListLoaded(this.hotelsList);

  @override
  List<Object> get props => [hotelsList];
}

class HotelsListError extends HotelsListState {
  final String message;

  HotelsListError(this.message);

  @override
  List<Object> get props => [message];
}
