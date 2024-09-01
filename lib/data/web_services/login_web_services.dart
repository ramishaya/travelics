import 'package:dio/dio.dart';

import '../../const/const.dart';

class LoginWebServices {
  late Dio dio;

  LoginWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseURl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  Future postLogin({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    print('Hello');
    print('data=$data');
    print(dio.options.baseUrl);
    Response response = await dio.post(
      url,
      data: data,
    );
    print('Hello2');
    print("response=${response.data}");
    return response;
  }
}
