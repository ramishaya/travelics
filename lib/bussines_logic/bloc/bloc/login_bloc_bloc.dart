import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/bussines_logic/bloc/bloc/login_bloc_state.dart';

import '../../../../data/web_services/login_web_services.dart';


import '../../../data/repository/login_repository.dart';
import 'login_bloc_event.dart';



class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginWebServices authService;
  final LoginRepository loginRepository;
  static String errorState = "";

  LoginBloc({required this.authService, required this.loginRepository})
      : super(LoginInitial()) {
    on<UserLoginEvent>((event, emit) {
      userLogin(email: event.email, password: event.password);
    });
  }

  void userLogin({required String email, required String password}) {
    emit(LoginProcessing());

    loginRepository.login(email, password).then((loginModel) {
      if (loginModel.user!.firstName != null) {
        print('access_token=${loginModel.token}');
      }
      // final accessToken = loginModel.token ?? '';
      // saveToken(accessToken);

      emit(LoginSuccess(loginModel));
    }).catchError((error) {
      if (error.toString().contains('401')) {
        errorState = "Invalid email or password";
        print("error_state=${errorState}");
        emit(LoginErrorState(errorMessage: errorState));
      }
    });
  }

  // Future<void> saveToken(String token) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('token', token);
  // }
}