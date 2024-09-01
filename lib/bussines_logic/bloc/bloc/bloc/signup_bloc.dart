/*import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meta/meta.dart';

import '../../../../data/models/signup_page_model.dart';
import '../../../../data/web_services/signup_web_services.dart';
import 'signup_event.dart';
import 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupWebServices signUpWepServices;
  final SignupWebServices authService;
  var sign_up_status = false;
  late SignupModel signUpModel;
  static String error_state = "";

  SignupBloc({required this.authService, required this.signUpWepServices})
      : super(SignupInitialState()) ;
    void userSignUp({var First_name,
      var Last_name,
      var nationality,
      var email,
      var password}) {
      emit(SignupLoadingState());
      signUpWepServices.postSignup(url: '/api/register', data: {
        'First_name': First_name,
        'Last_name': Last_name,
        'nationality': nationality,
        'email': email,
        'password': password,
      }).then((value) {
        print("result = ${value.data}");
        signUpModel = SignupModel.fromJson(value.data);
        if (signUpModel.user != null) {
          print('signInModel_dataUser_id=${signUpModel.user!.email}');
        }
        emit(SignUpSuccessed(signUpModel));
      }).catchError((error) {
        if (error.toString().contains('422') && password != null) {
          error_state = "The password confirmation does not match.";
          print("error_state=${error_state}");
          emit(SignupErrorState(errorMessage: error_state));
        } else if (error.toString().contains('422')) {
          error_state =
          'The given data was invalid.\nThe email has already been taken.';
          print("error_state=${error_state}");
          emit(SignupErrorState(errorMessage: error_state));
        }
      });
    }
  }
*/

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 
 
import '../../../../data/repository/signup_repository.dart';
import '../../../../data/web_services/login_web_services.dart';
 
import '../../../../data/web_services/sign_up_web_services.dart';
import 'signup_event.dart';
import 'signup_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignupWebServices authService;
  final SignupRepository signupRepository;
  static String errorState = "";

  SignupBloc({required this.authService, required this.signupRepository})
      : super(SignupInitialState()) {
    on<SignUpEvent>((event, emit) {
      userSignup(
          First_name: event.First_name,
          Last_name: event.Last_name,
          nationality: event.nationality,
          email: event.email,
          password: event.password);
    });
  }

  void userSignup(
      {required String First_name,
      required String Last_name,
      required String nationality,
      required String email,
      required String password}) {
    emit(SignupLoadingState());

    signupRepository.signup_r(First_name,Last_name,nationality,email,password).then((signupModel) {

      if (signupModel.token != null) {
        print('access_token=${signupModel.token}');
      }
     // print('access_token=${signupModel.user!.email}');
   //   print('access_token=${signupModel.user}');
      emit(SignUpSuccessed(signupModel));
    }).catchError((error) {
      if (error.toString().contains('401')) {
        errorState = "Invalid email or password";
        print("error_state=${errorState}");
        emit(SignupErrorState(errorMessage: errorState));
      }
    });
  }
}

/*
class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupWebServices signUpWepServices;
  final SignupWebServices authService;
  var sign_up_status = false;
  late SignupModel signUpModel;
  static String error_state = "";

  SignupBloc({required this.authService, required this.signUpWepServices})
      : super(SignupInitialState()) {
    on<SignUpEvent>((event, emit) async {
      emit(SignupLoadingState());
      try {
        final value = await signUpWepServices.postSignup(url: '/api/register', data: {
          'First_name': event.First_name,
          'Last_name': event.Last_name,
          'nationality': event.nationality,
          'email': event.email,
          'password': event.password,
        });
        print("result = ${value.data}");
        signUpModel = SignupModel.fromJson(value.data);
        if (signUpModel!.user != null) {
          print('signUpModel.user=${signUpModel!.user}');
        }
        if (signUpModel.token != null) {
          print('signUpModel.user=${signUpModel.token}');
        }
        if (signUpModel.state != null) {
          print('signUpModel.user=${signUpModel.state}');
        }
        emit(SignUpSuccessed(signUpModel));
      } catch (error) {
        if (error.toString().contains('401')) {
          error_state = "Invalid email or password";
          print("error_state=${error_state}");
          emit(SignupErrorState(errorMessage: error_state));
        }
      }
    });
  }
}

 */
