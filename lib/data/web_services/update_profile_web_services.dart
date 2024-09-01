import 'package:dio/dio.dart';

import '../../const/const.dart';
import '../../shared_preffrence.dart';


class UpdateProfileWebServices {
  late Dio dio;

  UpdateProfileWebServices() {
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

  Future<Response> postUpdateProfile({
    required String url,
    required FormData data, // Change the parameter type to FormData
  }) async {
    String? token = SharedPref.getData(key: 'token');
    if (token != null && token.isNotEmpty) {
      // Set the Authorization header with the token value
      dio.options.headers['Authorization'] = 'Bearer $token';
    }

    print('Hello');
    print('data=$url');
    print(dio.options.baseUrl);

    try {
      Response response = await dio.post(url, data: data);
      print('Hello2');
      print("response=${response.data}");
      return response;
    } catch (error) {
      print('Error: $error');
      rethrow; // Re-throw the error to be handled in the repository
    }
  }
}