import 'package:bloc/bloc.dart';

import '../../../data/repository/my_profile_repository.dart';
import '../../../data/web_services/my_profile_web_sercvices.dart';
import '../../../shared_preffrence.dart';
import 'my_profile_bloc_event.dart';
import 'my_profile_bloc_state.dart';

class MyProfileBloc extends Bloc<MyProfileEvent, MyProfileState> {
  final MyProfileWebServices authService;
  final MyProfileRepository myProfileRepository;
  static String errorState = "";

  MyProfileBloc({required this.authService, required this.myProfileRepository})
      : super(MyProfileInitial());

  void MyProfile() {
    emit(MyProfileProcessing());

    myProfileRepository.myProfile().then((myProfileModel) async {
      if (myProfileModel.firstName != null) {
        SharedPref.saveData(key: 'firstName', value: myProfileModel.firstName);
        SharedPref.saveData(key: 'lastName', value: myProfileModel.lastName);
        SharedPref.saveData(key: 'nationality', value: myProfileModel.nationality);
        SharedPref.saveData(key: 'gender', value: myProfileModel.gender);
        // await SharedPref.init(); // Initialize SharedPreferences if not already initialized
        // await SharedPref.saveData(key: 'image', value: myProfileModel.image);

        print('access_token=${myProfileModel.firstName!}');

      print('jaway');

      emit(MyProfileSuccess(myProfileModel)); // Emit the success state with updated profile data
      // Update Shared Preferences here

      } }).catchError((error) {
      if (error.toString().contains('401')) {
        errorState = "Invalid information";
        print("error_state=${errorState}");
        emit(MyProfileFailedState(errorMessage: errorState));
      }
    });
  }

  @override
  Stream<MyProfileState> mapEventToState(MyProfileEvent event) async* {
    if (event is MyProfileEvent) {
      MyProfile(); // Call the myProfile function when any MyProfileEvent is triggered
    }
  }


}
