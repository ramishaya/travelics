import 'package:meta/meta.dart';

abstract class CheckEmailEvent {}

class UserCheckEmailEvent extends CheckEmailEvent {
  final String email;


  UserCheckEmailEvent({required this.email});
}
