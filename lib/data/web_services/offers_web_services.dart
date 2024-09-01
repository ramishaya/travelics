// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:tourism/const/const.dart';

class OffersWebServices {
  late Dio dio;
  OffersWebServices() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseURl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(baseOptions);
  }
  Future<dynamic> fetchOffers(String name) async {
    try {
      final response = await dio.post(
        'api/offer_room',
        data: {
          "name": name,
        },
      );
      print("we are in the offers web services ");
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      print("error in offers web services class");
      return {[]};
    }
  }
}
