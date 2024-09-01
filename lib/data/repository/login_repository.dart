import '../models/login_model.dart';

import '../web_services/login_web_services.dart';

class LoginRepository {
  final LoginWebServices loginWebServices;

  LoginRepository({required this.loginWebServices});

  Future<LoginModel> login(String email, String password) async {
    try {
      final response = await loginWebServices.postLogin(
        url: '/api/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      print('Hello3');
      print('$response.data');
      final loginModel = LoginModel.fromJson(response.data);
      print('Hello4');
      print('nationality: ${loginModel.user?.nationality}');
      print('first name: ${loginModel.user?.firstName}');
      print('last name: ${loginModel.user?.lastName}');
      return loginModel;
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }
}
