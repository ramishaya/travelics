import 'package:dio/dio.dart';

import '../../const/const.dart';
import '../../shared_preffrence.dart';

class LogOutWebServices {
  late Dio dio;

  LogOutWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseURl,
      receiveDataWhenStatusError: true,
      headers: {
        // Add the Authorization header without the token value for now
        'Authorization': 'Bearer ',
      },
    );
    dio = Dio(options);
  }

  Future logout({
    required String url,
  }) async {
    String? token = SharedPref.getData(key: 'token');
    if (token != null && token.isNotEmpty) {
      // Set the Authorization header with the token value
      dio.options.headers['Authorization'] = 'Bearer $token';
    }

    print('Hello');
    print('data=$url');
    print(dio.options.baseUrl);
    Response response = await dio.get(url);
    print('Hello2');
    print("response=${response.data}");
    return response;
  }
}
