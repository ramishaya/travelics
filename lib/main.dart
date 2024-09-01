import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/bussines_logic/bloc/bloc/login_bloc_bloc.dart';
import 'package:tourism/bussines_logic/cubits/cubit/cubit/city_guide_cubit.dart';
import 'package:tourism/bussines_logic/cubits/cubit/my_reserve_cubit.dart';
import 'package:tourism/bussines_logic/cubits/cubit/offers_cubit.dart';
import 'package:tourism/const/const.dart';

import 'package:tourism/data/repository/city_guide_repository.dart';
import 'package:tourism/data/repository/my_reserve_repository.dart';
import 'package:tourism/data/repository/offers_repository.dart';

import 'package:tourism/data/web_services/city_guide_web_services.dart';

import 'package:tourism/data/web_services/my_reserve_web_services.dart';
import 'package:tourism/data/web_services/offers_web_services.dart';

import 'package:tourism/presentation/screens/login/reset_password.dart';
import 'package:tourism/routes.dart';
import 'package:tourism/shared_preffrence.dart';

import 'bussines_logic/bloc/bloc/bloc/bloc/update_profile_bloc_bloc.dart';
import 'bussines_logic/bloc/bloc/bloc/logout_bloc.dart';
import 'bussines_logic/bloc/bloc/bloc/signup_bloc.dart';
import 'bussines_logic/bloc/bloc/my_profile_bloc_bloc.dart';
import 'bussines_logic/bloc/bloc/resetpassword_bloc_bloc.dart';
import 'bussines_logic/bloc/checkemail_bloc.dart';
import 'bussines_logic/bloc/emailvri_bloc.dart';
import 'data/repository/check_email_repository.dart';
import 'data/repository/emailvri_repository.dart';
import 'data/repository/login_repository.dart';
import 'data/repository/logout_repository.dart';
import 'data/repository/my_profile_repository.dart';
import 'data/repository/resetpassword_repository.dart';
import 'data/repository/signup_repository.dart';
import 'data/repository/update_profile_repository.dart';
import 'data/web_services/check_email_web_services.dart';
import 'data/web_services/emailvri_web_services.dart';
import 'data/web_services/login_web_services.dart';
import 'data/web_services/logout_web_services.dart';
import 'data/web_services/my_profile_web_sercvices.dart';
import 'data/web_services/reset_password_web_services.dart';
import 'data/web_services/sign_up_web_services.dart';
import 'data/web_services/update_profile_web_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPref.init();

  runApp(MyApp(appRoute: AppRoute()));

  // CityGuideRepository(cityGuideWebServices: CityGuideWebServices())
  //     .gatAllCity();
  // print("we are in the main");
  //MyReserveRepository(myResrveWebServices: MyResrveWebServices())
  //  .fetchMyReserveList();
  print("we are in the main");
  // OffersRepository(offersWebServices: OffersWebServices())
  //     .fetchOffers("Four Seasons Hotel");

  OffersCubit(
          offersRepository:
              OffersRepository(offersWebServices: OffersWebServices()))
      .fetchOffers("Four Seasons Hotel");
}

class MyApp extends StatefulWidget {
  final AppRoute appRoute;
  const MyApp({super.key, required this.appRoute});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late LoginRepository loginRepository;
  late SignupRepository signupRepository;
  late Email_Virffication_Repository email_Virffication_Repository;
  late CheckEmailRepository checkEmailRepository;
  late Reset_Password_Repository reset_Password_Repository;
  late LogOutRepository logOutRepository;
  late UpdateProfileRepository updateProfileRepository;
  late MyProfileRepository myProfileRepository;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginRepository = _createLoginRepository();
    signupRepository = _createsignupRepository();
    email_Virffication_Repository = _createEmail_Virffication_Repository();
    checkEmailRepository = _createCheckEmailRepository();
    reset_Password_Repository = _createReset_Password_Repository();

    logOutRepository = _createlogOutRepository();
    updateProfileRepository = _createupdateProfileRepository();
    myProfileRepository = _createmyProfileRepository();
  }

  LoginRepository _createLoginRepository() {
    final loginWebServices = LoginWebServices();
    return LoginRepository(loginWebServices: loginWebServices);
  }

  SignupRepository _createsignupRepository() {
    final signUpWepServices = SignupWebServices();
    return SignupRepository(signupWebServices: signUpWepServices);
  }

  Email_Virffication_Repository _createEmail_Virffication_Repository() {
    final email_Virffication_WebServices = Email_Virffication_WebServices();
    return Email_Virffication_Repository(
        email_Virffication_WebServices: email_Virffication_WebServices);
  }

  CheckEmailRepository _createCheckEmailRepository() {
    final checkEmailWebServices = CheckEmailWebServices();
    return CheckEmailRepository(checkEmailWebServices: checkEmailWebServices);
  }

  Reset_Password_Repository _createReset_Password_Repository() {
    final reset_Password_WebServices = Reset_Password_WebServices();
    return Reset_Password_Repository(
        reset_Password_WebServices: reset_Password_WebServices);
  }

  LogOutRepository _createlogOutRepository() {
    final logOutRepository = LogOutWebServices();
    return LogOutRepository(logOutWebServices: logOutRepository);
  }

  UpdateProfileRepository _createupdateProfileRepository() {
    final updateProfileRepository = UpdateProfileWebServices();
    return UpdateProfileRepository(
        updateProfileWebServices: updateProfileRepository);
  }

  MyProfileRepository _createmyProfileRepository() {
    final myProfileRepository = MyProfileWebServices();
    return MyProfileRepository(myProfileWebServices: myProfileRepository);
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: loginRepository),
        RepositoryProvider.value(value: signupRepository),
        RepositoryProvider.value(value: email_Virffication_Repository),
        RepositoryProvider.value(value: checkEmailRepository),
        RepositoryProvider.value(value: reset_Password_Repository),
        RepositoryProvider.value(value: logOutRepository),
        RepositoryProvider.value(value: updateProfileRepository),
        RepositoryProvider.value(value: myProfileRepository),
      ],
      child: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => LoginBloc(
                    authService: LoginWebServices(),
                    loginRepository: loginRepository)),
            BlocProvider(
              create: (context) => SignupBloc(
                authService: signupRepository.signupWebServices,
                signupRepository: signupRepository,
              ),
            ),
            BlocProvider<Email_Virffication_Bloc>(
                create: (context) => Email_Virffication_Bloc(
                      authService: email_Virffication_Repository
                          .email_Virffication_WebServices,
                      email_Virffication_Repository:
                          email_Virffication_Repository,
                    )),
            BlocProvider(
              create: (context) => CityGuideCubit(
                  cityGuideRepository: CityGuideRepository(
                      cityGuideWebServices: CityGuideWebServices())),
            ),
            BlocProvider(
              create: (context) => MyReserveCubit(
                  myReserveRepository: MyReserveRepository(
                      myResrveWebServices: MyResrveWebServices())),
            ),
            BlocProvider<CheckEmailBloc>(
              create: (context) => CheckEmailBloc(
                authService: checkEmailRepository.checkEmailWebServices,
                checkEmailRepository: checkEmailRepository,
              ),
            ),
            BlocProvider<LogOutBloc>(
              create: (context) => LogOutBloc(
                authService: logOutRepository.logOutWebServices,
                logOutRepository: logOutRepository,
              ),
            ),
            BlocProvider<UpdateProfileBloc>(
              create: (context) => UpdateProfileBloc(
                authService: updateProfileRepository.updateProfileWebServices,
                updateProfileRepository: updateProfileRepository,
              ),
            ),
            BlocProvider<MyProfileBloc>(
              create: (context) => MyProfileBloc(
                authService: myProfileRepository.myProfileWebServices,
                myProfileRepository: myProfileRepository,
              ),
            ),
            BlocProvider<Reset_Password_Bloc>(
              create: (context) => Reset_Password_Bloc(
                authService:
                    reset_Password_Repository.reset_Password_WebServices,
                reset_Password_Repository: reset_Password_Repository,
              ),
              child: const Reset_Password_Page(),
            ),
          ],
          child: MaterialApp(
            color: const Color(kPrimaryColor),
            initialRoute: home,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: widget.appRoute.GenerateRoute,
            theme: ThemeData(
              primaryColor: const Color(kPrimaryColor),
            ),
          )),
    );
  }
}
