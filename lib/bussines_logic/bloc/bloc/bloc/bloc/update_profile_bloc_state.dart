import '../../../../../data/models/update_profile.dart';

abstract class UpdateProfileState {}

class UserUpdateProfileInitialState extends UpdateProfileState {}

class UserUpdateProfileLoadingState extends UpdateProfileState {}

class UserUpdateProfileSuccessState extends UpdateProfileState {
 final UpdateProfileModel updateProfileModel;

  UserUpdateProfileSuccessState(this.updateProfileModel);
}

class UserUpdateProfileErrorState extends UpdateProfileState {
  final String errorMessage;

  UserUpdateProfileErrorState({required this.errorMessage});
}
