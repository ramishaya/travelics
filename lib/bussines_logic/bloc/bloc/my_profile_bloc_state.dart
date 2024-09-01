


import 'package:flutter/cupertino.dart';

import '../../../data/models/my_profile.dart';

@immutable
abstract class MyProfileState {}

class MyProfileInitial extends MyProfileState {}

class MyProfileProcessing extends MyProfileState {}

class MyProfileSuccess extends MyProfileState {
  final MyProfileModel myProfileModel;

  MyProfileSuccess(this.myProfileModel);
}

class MyProfileFailedState extends MyProfileState {
  final String errorMessage;

  MyProfileFailedState({required this.errorMessage});
}
