import 'package:dio/dio.dart';

import '../../const/const.dart';

class Email_Virffication_WebServices {
  late Dio dio;

  Email_Virffication_WebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseURl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options);
  }
  Future postEmailVirffication({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    try {
      print('Hello');
      print('data=$data');
      print(dio.options.baseUrl);
      Response response = await dio.post(
        url,
        data: data,
      );
      print('Hello2');
      print("response=${response.data}");
      return response.data;
    } catch (error) {
      print('Error during API call: $error');
      throw Exception('Failed to connect to the API');
    }
  }

}
