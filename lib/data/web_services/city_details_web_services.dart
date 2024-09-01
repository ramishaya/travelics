// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:tourism/const/const.dart';

class CityDetailsWebServices {
  late Dio dio;
  CityDetailsWebServices() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseURl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(baseOptions);
  }
  Future<dynamic> fetchCityDetails(String name) async {
    try {
      final response = await dio.post(
        'api/profile_city',
        data: {
          "name": name,
        },
      );
      print(response.data.toString());
      print("we got the city details data");
      return response.data;
    } catch (e) {
      print(e.toString());
      print("error in web services class");
      return {[]};
    }
  }
}
