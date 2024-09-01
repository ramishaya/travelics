
import 'package:flutter/cupertino.dart';

import '../../../../data/models/sign_up.dart';

 

@immutable
abstract class SignupState {}

class SignupInitialState extends SignupState {}
class SignupLoadingState extends SignupState{}
class SignUpSuccessed extends SignupState{
  final SignupModel signUpModel;

  SignUpSuccessed(this.signUpModel);
}
class SignupErrorState extends SignupState{
  final String errorMessage ;

  SignupErrorState({required this.errorMessage});
}
