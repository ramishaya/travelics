part of 'room_cubit.dart';



abstract class RoomState extends Equatable {
  const RoomState();

  @override
  List<Object> get props => [];
}

class RoomInitial extends RoomState {}

class RoomLoading extends RoomState {}

class RoomLoaded extends RoomState {
  final List<RoomModel> roomList;

   RoomLoaded(this.roomList);

  @override
  List<Object> get props => [roomList];
}

class RoomError extends RoomState {
  final String message;

  RoomError(this.message);

  @override
  List<Object> get props => [message];
}
