import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/emailvri_repository.dart';
import '../../data/web_services/emailvri_web_services.dart';
import 'emailvri_event.dart';
import 'emailvri_state.dart';
 


class Email_Virffication_Bloc extends Bloc<Email_Virffication_Event, Email_Virffication_State> {
  final Email_Virffication_WebServices authService;
  final Email_Virffication_Repository email_Virffication_Repository;
  static String errorState = "";



  Email_Virffication_Bloc({required this.authService, required this.email_Virffication_Repository})
      : super(User_Email_Virffication_InitialState()) {
    on<User_Email_Virffication_Event>((event, emit) {
      user_email_v(email: event.email, otp: event.otp);
    });
  }

  void user_email_v({required String email,required String otp}) {
    emit(User_Email_Virffication_LoadingState());

    email_Virffication_Repository.post_Email_Virffication(email,otp).then((email_Virffication_Model) {
      if (email_Virffication_Model.message == "success") {
        print('access_token=${email_Virffication_Model.message!}');
      }


      emit(User_Email_Virffication_SuccessState(email_Virffication_Model));
    }).catchError((error) {
      if (error.toString().contains('401')) {
        errorState = "Invalid email or password";
        print("error_state=${errorState}");
        emit(User_Email_Virffication_ErrorState(errorMessage: errorState));
      }
    });
  }

}