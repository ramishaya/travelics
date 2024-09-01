import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/bussines_logic/bloc/bloc/resetpassword_bloc_event.dart';
import 'package:tourism/bussines_logic/bloc/bloc/resetpassword_bloc_state.dart';

import '../../../data/repository/resetpassword_repository.dart';
import '../../../data/web_services/reset_password_web_services.dart';




class Reset_Password_Bloc extends Bloc<Reset_Password_Event, Reset_Password_State> {
  final Reset_Password_WebServices authService;
  final Reset_Password_Repository reset_Password_Repository;
  static String errorState = "";



  Reset_Password_Bloc({required this.authService, required this.reset_Password_Repository})
      : super(User_Reset_Password_InitialState()) {
    on<User_Reset_Password_Event>((event, emit) {
      user_reset(email: event.email, otp: event.otp, password: event.password);
    });
  }

  void user_reset({required String email,required String otp,required String password}) {
    emit(User_Reset_Password_LoadingState());

    reset_Password_Repository.post_Reset_Password(email,otp,password).then((reset_Password_Model) {
      if (reset_Password_Model.message == "success") {
        print('access_token=${reset_Password_Model.message!}');
      }


      emit(User_Reset_Password_SuccessState(reset_Password_Model));
    }).catchError((error) {
      if (error.toString().contains('401')) {
        errorState = "Invalid email or password";
        print("error_state=${errorState}");
        emit(User_Reset_Password_ErrorState(errorMessage: errorState));
      }
    });
  }

}