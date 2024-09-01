




import '../../data/models/emailvrimodel.dart';

abstract class Email_Virffication_State {}

class User_Email_Virffication_InitialState extends Email_Virffication_State {}

class User_Email_Virffication_LoadingState extends Email_Virffication_State {}

class User_Email_Virffication_SuccessState extends Email_Virffication_State {
  final Email_Virffication_Model email_virffication_Model;

  User_Email_Virffication_SuccessState(this.email_virffication_Model);

}

class User_Email_Virffication_ErrorState extends Email_Virffication_State {
  final String errorMessage;

  User_Email_Virffication_ErrorState({required this.errorMessage});
}
