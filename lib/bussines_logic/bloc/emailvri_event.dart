import 'package:meta/meta.dart';

abstract class Email_Virffication_Event {}

class User_Email_Virffication_Event extends Email_Virffication_Event {
  final String email;
  final String otp;
  User_Email_Virffication_Event({required this.email,required this.otp});
}
