

import 'package:dio/dio.dart';

import '../../const/const.dart';

class CityGuideWebServices{
   late Dio dio;
  static const limit = 10;
 

  CityGuideWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseURl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCity() async {
    try {
      final response = await dio.get('api/city');
      //await dio.get(baseUrl);
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}