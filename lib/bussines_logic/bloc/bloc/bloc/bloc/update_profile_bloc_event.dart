import 'dart:io';

import 'package:meta/meta.dart';

abstract class UpdateProfileEvent {}

class UserUpdateProfileEvent extends UpdateProfileEvent {
  final String gender;
  final String First_name;
  final String Last_name;
  final String nationality;
  final File? image;

  UserUpdateProfileEvent({
    required this.First_name,
    required this.Last_name,
    required this.nationality,
    required this.gender,
    required  this.image,
  });
}
