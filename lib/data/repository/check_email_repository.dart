


import '../models/check_email_model.dart';
import '../web_services/check_email_web_services.dart';

class CheckEmailRepository {
  final CheckEmailWebServices checkEmailWebServices;

  CheckEmailRepository({required this.checkEmailWebServices});

  Future<CheckEmailModel> postCheckEmail(String email) async {
    try {
      final response = await checkEmailWebServices.postCheckEmail(
        url: '/api/ForgetPassword',
        data: {
          'email': email,
        },
      );

      print('Hello3');
      print('$response.data');
      final checkEmailModel = CheckEmailModel.fromJson(response.data);
      print('Hello4');
      print('$checkEmailModel');
      print("response=${checkEmailModel}");
      print("response=${checkEmailModel.message}");
      return checkEmailModel;
    } catch (e) {
      throw Exception('Failed $e');
    }
  }
}
