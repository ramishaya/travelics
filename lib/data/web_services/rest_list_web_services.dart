// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tourism/const/const.dart';

class RestListWebServices {
  late Dio dio;
  RestListWebServices() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseURl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(baseOptions);
  }

  Future<List<dynamic>> fetchRestList(String name) async {
    try {
      final response = await dio.post(
        'api/search_restaurant',
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
