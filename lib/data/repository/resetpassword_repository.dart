

import '../models/resetpassword_model.dart';
import '../web_services/reset_password_web_services.dart';

class Reset_Password_Repository {
  final Reset_Password_WebServices reset_Password_WebServices;

  Reset_Password_Repository({required this.reset_Password_WebServices});

  Future<Reset_Password_Model> post_Reset_Password(String email,String otp,String password) async {
    try {
      print('marhaba');
      final response = await reset_Password_WebServices.postResetPassword(
        url: '/api/reset',
        data: {
          'email': email,
          'otp': otp,
          'password': password,
        },
      );

      print('Hello3');
      print('$response.data');
      final reset_Password_Model = Reset_Password_Model.fromJson(response);
      print('Hello4');
      print('$reset_Password_Model');
      print("response=${reset_Password_Model}");
      print("response=${reset_Password_Model.message}");
      return reset_Password_Model;
    } catch (e) {
      throw Exception('Failed $e');
    }
  }
}
