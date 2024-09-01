// login_state.dart
import 'package:equatable/equatable.dart';

 
import '../../../data/models/login_model.dart';


abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginProcessing extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginModel loginModel;

  const LoginSuccess(this.loginModel);


}

class LoginErrorState extends LoginState {
  final String errorMessage;

  const LoginErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
