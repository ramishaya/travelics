





import '../../../data/models/resetpassword_model.dart';

abstract class Reset_Password_State {}

class User_Reset_Password_InitialState extends Reset_Password_State {}

class User_Reset_Password_LoadingState extends Reset_Password_State {}

class User_Reset_Password_SuccessState extends Reset_Password_State {
  final Reset_Password_Model reset_Password_Model;

  User_Reset_Password_SuccessState(this.reset_Password_Model);

}

class User_Reset_Password_ErrorState extends Reset_Password_State {
  final String errorMessage;

  User_Reset_Password_ErrorState({required this.errorMessage});
}
