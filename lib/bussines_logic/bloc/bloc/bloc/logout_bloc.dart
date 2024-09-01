import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/repository/logout_repository.dart';
import '../../../../data/web_services/logout_web_services.dart';
import '../logout_state.dart';
import 'logout_event.dart';



class LogOutBloc extends Bloc<LogOutEvent, LogOutState> {
  final LogOutWebServices authService;
  final LogOutRepository logOutRepository;
  static String errorState = "";

  LogOutBloc({required this.authService, required this.logOutRepository})
      : super(LogOutInitial());

  void LogOut() {
    emit(LogOutProcessing());

    logOutRepository.logout().then((logOutMessage) {
      if (logOutMessage.massage == "logged out successfully") {
        print('access_token=${logOutMessage.massage!}');
      }

      emit(LogOutSuccess(logOutMessage));
    }).catchError((error) {
      if (error.toString().contains('401')) {
        errorState = "Invalid email or password";
        print("error_state=${errorState}");
        emit(LogOutFailedState(errorMessage: errorState));
      }
    });
  }
}
