import 'package:meta/meta.dart';

abstract class Reset_Password_Event {}

class User_Reset_Password_Event extends Reset_Password_Event {
  final String email;
  final String otp;
  final String password;
  User_Reset_Password_Event({required this.email,required this.otp,required this.password});
}
