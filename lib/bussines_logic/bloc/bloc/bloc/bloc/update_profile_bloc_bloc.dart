import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/bussines_logic/bloc/bloc/bloc/bloc/update_profile_bloc_event.dart';
import 'package:tourism/bussines_logic/bloc/bloc/bloc/bloc/update_profile_bloc_state.dart';


import '../../../../../data/repository/update_profile_repository.dart';
import '../../../../../data/web_services/update_profile_web_services.dart';

class UpdateProfileBloc extends Bloc<UpdateProfileEvent, UpdateProfileState> {
  final UpdateProfileWebServices authService;
  final UpdateProfileRepository updateProfileRepository;
  static String errorState = "";

  UpdateProfileBloc(
      {required this.authService, required this.updateProfileRepository})
      : super(UserUpdateProfileInitialState()) {
    on<UserUpdateProfileEvent>((event, emit) {
      user_updateProfile(
        image: event.image,
        First_name: event.First_name,
        Last_name: event.Last_name,
        nationality: event.nationality,
        gender: event.gender,
      );
    });
  }

  void user_updateProfile(
      {required String First_name,
      required String Last_name,
      required String nationality,
      required String gender,
      required File? image}) {
    emit(UserUpdateProfileLoadingState());

    updateProfileRepository
        .postUpdateProfile(First_name, Last_name, nationality, gender, image!)
        .then((updateProfileModel) {
      if (updateProfileModel.state == 200) {
        print('access_token=${updateProfileModel.state}');

        /*   final accessToken = checkEmailModel.message ?? '';
      saveToken(accessToken);*/

        emit(UserUpdateProfileSuccessState(updateProfileModel));
      }
    }).catchError((error) {
      if (error.toString().contains('401')) {
        errorState = "Invalid ";
        print("error_state=${errorState}");
        emit(UserUpdateProfileErrorState(errorMessage: errorState));
      }
    });
  }
}
