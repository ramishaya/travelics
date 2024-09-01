



import '../models/logoutmodel.dart';
import '../web_services/logout_web_services.dart';

class LogOutRepository {
  final LogOutWebServices logOutWebServices;

  LogOutRepository({required this.logOutWebServices});

  Future<LogoutModel> logout() async {
    try {
      final response = await logOutWebServices.logout(
        url: '/api/logout',
      );
      print('Hello3');
      print('$response.data');
      final logoutModel = LogoutModel.fromJson(response.data);
      print('Hello4');
      print('massage: ${logoutModel.massage}');

      return logoutModel;
    } catch (e) {
      throw Exception('Failed to logout!: $e');
    }
  }
}
