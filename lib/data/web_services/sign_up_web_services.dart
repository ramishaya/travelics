import 'package:dio/dio.dart';
import '../../const/const.dart';


class SignupWebServices {
  late Dio dio;

  SignupWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseURl,
      receiveDataWhenStatusError: true,
     connectTimeout: const Duration(seconds: 20),
     receiveTimeout: const Duration(seconds: 20),
        headers: {
          'Accept':'application/json',
     //     'Authorization':SharedPref.getData(key: 'token'),
        }
    );
    dio = Dio(options);
  }

  Future postSignup({
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
