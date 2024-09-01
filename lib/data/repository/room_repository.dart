

import '../models/room_model.dart';
import '../web_services/room_web_services.dart';

class RoomRepository{
  final RoomWebServices roomWebServices;

  RoomRepository({required this.roomWebServices});

  Future<List<RoomModel>> fetchRooms(String name) async {
    try {
      final response = await roomWebServices.fetchRooms(name);
      final roomsList = response
          .map((e) => RoomModel.fromJson(e as Map<String, dynamic>))
          .toList();
      print(roomsList[0].type);
      return roomsList;
    } catch (e) {
      print(e.toString());
      print("error in repository");
      return [];
    }
  }
}