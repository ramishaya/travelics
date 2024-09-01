import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/room_model.dart';
import '../../../data/repository/room_repository.dart';

part 'room_state.dart';

class RoomCubit extends Cubit<RoomState> {
  final RoomRepository roomRepository;
  RoomCubit({required this.roomRepository}) : super(RoomInitial());
  List<RoomModel> roomList = [];

//   List<RoomModel> fetchRooms(String hotelName) {
//     roomRepository.fetchRooms(hotelName).then((e) {
//       emit(RoomLoaded(e));
//       roomList = e;
//     });
//     print("we are in the cubit");
//     print(roomList[0].toString());
//     return roomList;
//   }
//   void reset() {
//     emit(RoomInitial());
//   }
// }
void fetchRooms(String hotelName) {
    roomRepository.fetchRooms(hotelName).then((e) {
      emit(RoomLoaded(e));
      roomList = e;
      print("we are in the cubit");
      print(roomList[0].toString());
    }).catchError((error) {
      emit(RoomError("Failed to fetch rooms: $error"));
    });
  }
  
  void reset() {
    emit(RoomInitial());
  }
}