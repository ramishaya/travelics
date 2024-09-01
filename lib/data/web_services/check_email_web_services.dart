import 'package:dio/dio.dart';

import '../../const/const.dart';

class CheckEmailWebServices {
  late Dio dio;

  CheckEmailWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseURl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  Future postCheckEmail({
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
