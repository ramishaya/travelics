// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:tourism/const/const.dart';

class ActivitesDetailsWebServices {
  late Dio dio;
  ActivitesDetailsWebServices() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseURl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(baseOptions);
  }
  Future <dynamic> fetchActivitesDetails(String name) async {
    try {
      final response = await dio.post(
        'api/profile_places',
        data: {
          "name": name,
        },
      );
      // print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      print("error in web services class");
      return {

      };
    }
  }
}
