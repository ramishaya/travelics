// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tourism/const/const.dart';
import 'package:tourism/shared_preffrence.dart';

class MyResrveWebServices {
  late Dio dio;
  
  MyResrveWebServices() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseURl,
      // headers: {
      //   'Authorization': 'Bearer $token',
      // },
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(baseOptions);
  }

  Future<dynamic> fetchMyResrveList() async {
    String? token = SharedPref.getData(key: 'token');
    if (token != null && token.isNotEmpty) {
      // Set the Authorization header with the token value
      dio.options.headers['Authorization'] = 'Bearer $token';
    }
    try {
      final response = await dio.get(
        'api/my_reserve',
      );
      print("my reserve data");
      print(response.data.toString());
      return response;
    } catch (e) {
      print(e.toString());
      print("error in web services class in My reserve class ");
      return [];
    }
  }
}
