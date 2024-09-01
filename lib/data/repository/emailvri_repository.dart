 
import '../models/emailvrimodel.dart';
 
 
import '../web_services/emailvri_web_services.dart';
 


class Email_Virffication_Repository {
  final Email_Virffication_WebServices email_Virffication_WebServices;

  Email_Virffication_Repository({required this.email_Virffication_WebServices});

  Future<Email_Virffication_Model> post_Email_Virffication(String email,String otp) async {
    try {
      print('marhaba');
      final response = await email_Virffication_WebServices.postEmailVirffication(
        url: '/api/email',
        data: {
          'email': email,
          'otp': otp,

        },
      );

      print('Hello3');
      print('$response.data');
      final email_Virffication_Model = Email_Virffication_Model.fromJson(response);
      print('Hello4');
      print('$email_Virffication_Model');
      print("response=${email_Virffication_Model}");
      print("response=${email_Virffication_Model.message}");
      return email_Virffication_Model;
    } catch (e) {
      throw Exception('Failed $e');
    }
  }
}
