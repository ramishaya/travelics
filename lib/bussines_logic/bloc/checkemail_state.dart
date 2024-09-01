


 

import '../../data/models/check_email_model.dart';

abstract class CheckEmailState {}

class UserCheckEmailInitialState extends CheckEmailState {}

class UserCheckEmailLoadingState extends CheckEmailState {}

class UserCheckEmailSuccessState extends CheckEmailState {
  final CheckEmailModel checkEmailModel;

  UserCheckEmailSuccessState(this.checkEmailModel);

}

class UserCheckEmailErrorState extends CheckEmailState {
  final String errorMessage;

  UserCheckEmailErrorState({required this.errorMessage});
}
