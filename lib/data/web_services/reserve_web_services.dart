import 'package:dio/dio.dart';

import '../../const/const.dart';
import '../../shared_preffrence.dart';

class ReserveWebServices {
  late Dio dio;
  
  ReserveWebServices() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseURl,
     // headers: {
       // 'Authorization': 'Bearer ${SharedPref.getData(key:'token')}',
     // },
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(baseOptions);
  }
  Future<dynamic> makeResreve(
      String email, int password, int roomId, int duration) async {
        String? token = SharedPref.getData(key: 'token');
    if (token != null && token.isNotEmpty) {
     
      dio.options.headers['Authorization'] = 'Bearer $token';
    }
    try {
      final response = await dio.post(
        'api/reserve',
        data: {
          "email": email,
          "password": password,
          "room_id": roomId,
          "duration": duration
        },
      );
      print(response.data.toString());
      return response.data;
    } catch (e) {
     // print(e.toString());
      print("error in web services reserve class ");
      return {
[]
      };
    }
  }
}
