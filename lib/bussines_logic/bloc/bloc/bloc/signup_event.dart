import 'package:flutter/cupertino.dart';

@immutable
abstract class SignupEvent {}

class SignUpEvent extends SignupEvent {
  String First_name = '';
  String Last_name = '';
  String nationality = '';
  String email = '';
  String password = '';

  SignUpEvent(
      {required this.First_name,
      required this.Last_name,
      required this.nationality,
      required this.email,
      required this.password});
}
