import 'package:tourism/data/models/logoutmodel.dart';

abstract class LogOutState {}

class LogOutInitial extends LogOutState {}

class LogOutProcessing extends LogOutState {}

class LogOutSuccess extends LogOutState {
  final LogoutModel logoutModel;

  LogOutSuccess(this.logoutModel);
}

class LogOutFailedState extends LogOutState {
  final String errorMessage;

  LogOutFailedState({required this.errorMessage});
}
