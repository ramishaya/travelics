

import 'package:dio/dio.dart';

import '../../const/const.dart';

class RoomWebServices{
   late Dio dio;
  RoomWebServices() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseURl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(baseOptions);
  }
  Future<List<dynamic>> fetchRooms(String name) async {
    try {
      final response = await dio.post(
        'api/room',
        data: {
          "name": name,
        },
      );
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      print("error in web services class");
      return [];
    }
  }
}