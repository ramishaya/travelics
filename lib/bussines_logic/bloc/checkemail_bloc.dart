import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism/bussines_logic/bloc/checkemail_event.dart';
import 'package:tourism/bussines_logic/bloc/checkemail_state.dart';

import '../../data/repository/check_email_repository.dart';
import '../../data/web_services/check_email_web_services.dart';
 

class CheckEmailBloc extends Bloc<CheckEmailEvent, CheckEmailState> {
  final CheckEmailWebServices authService;
  final CheckEmailRepository checkEmailRepository;
  static String errorState = "";



  CheckEmailBloc({required this.authService, required this.checkEmailRepository})
      : super(UserCheckEmailInitialState()) {
    on<UserCheckEmailEvent>((event, emit) {
     user_check(email: event.email);
    });
  }

  void user_check({required String email}) {
    emit(UserCheckEmailLoadingState());

    checkEmailRepository.postCheckEmail(email).then((checkEmailModel) {
      if (checkEmailModel.message == "success") {
        print('access_token=${checkEmailModel.message!}');
      }

   /*   final accessToken = checkEmailModel.message ?? '';
      saveToken(accessToken);*/

      emit(UserCheckEmailSuccessState(checkEmailModel));
    }).catchError((error) {
      if (error.toString().contains('401')) {
        errorState = "Invalid email or password";
        print("error_state=${errorState}");
        emit(UserCheckEmailErrorState(errorMessage: errorState));
      }
    });
  }
/*
  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }*/
}