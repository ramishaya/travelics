import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/bussines_logic/bloc/weather_bloc.dart';
import 'package:tourism/bussines_logic/cubits/cubit/cubit/city_guide_cubit.dart';
import 'package:tourism/bussines_logic/cubits/cubit/cubit/reserve_cubit.dart';
import 'package:tourism/bussines_logic/cubits/cubit/hotels_details_cubit.dart';
import 'package:tourism/bussines_logic/cubits/cubit/hotels_list_cubit.dart';
import 'package:tourism/bussines_logic/cubits/cubit/my_reserve_cubit.dart';
import 'package:tourism/bussines_logic/cubits/cubit/room_cubit.dart';
import 'package:tourism/bussines_logic/cubits/trip_type/trip_type_cubit.dart';

import 'package:tourism/data/repository/city_guide_repository.dart';
import 'package:tourism/data/repository/hotels_list_repository.dart';
import 'package:tourism/data/repository/my_reserve_repository.dart';
import 'package:tourism/data/repository/resrve_repository.dart';
import 'package:tourism/data/repository/room_repository.dart';
import 'package:tourism/data/repository/weather_repository.dart';
import 'package:tourism/data/web_services/activites_details_web_services.dart';
import 'package:tourism/data/web_services/city_guide_web_services.dart';
import 'package:tourism/data/web_services/hotels_list_web_services.dart';
import 'package:tourism/data/web_services/my_reserve_web_services.dart';
import 'package:tourism/data/web_services/reserve_web_services.dart';
import 'package:tourism/data/web_services/rest_details_web_services.dart';
import 'package:tourism/data/web_services/room_web_services.dart';
import 'package:tourism/presentation/screens/activites/activites_details.dart';
import 'package:tourism/presentation/screens/activites/activites_list.dart';
import 'package:tourism/presentation/screens/activites/activites_search.dart';
import 'package:tourism/presentation/screens/city_details.dart';
import 'package:tourism/presentation/screens/comments/comment.dart';

import 'package:tourism/presentation/screens/flights/flights_search.dart';
import 'package:tourism/presentation/screens/hotels/hotels_details.dart';
import 'package:tourism/presentation/screens/hotels/hotels_list.dart';
import 'package:tourism/presentation/screens/hotels/hotels_search.dart';
import 'package:tourism/presentation/screens/hotels/reserve_hotel_.dart';
import 'package:tourism/presentation/screens/login/check_email.dart';
import 'package:tourism/presentation/screens/login/login.dart';
import 'package:tourism/presentation/screens/login/reset_password.dart';
import 'package:tourism/presentation/screens/navpages/account.dart';
import 'package:tourism/presentation/screens/navpages/general_search.dart';

import 'package:tourism/presentation/screens/navpages/home.dart';
import 'package:tourism/presentation/screens/navpages/my_profile.dart';

import 'package:tourism/presentation/screens/navpages/my_trips.dart';
import 'package:tourism/presentation/screens/navpages/update_profile.dart';
import 'package:tourism/presentation/screens/offers/offers_list.dart';
import 'package:tourism/presentation/screens/offers/offfers_search.dart';
import 'package:tourism/presentation/screens/restaurants/rest_details.dart';
import 'package:tourism/presentation/screens/restaurants/rest_list.dart';
import 'package:tourism/presentation/screens/restaurants/rest_search.dart';
import 'package:tourism/presentation/screens/signup/emailvri.dart';
import 'package:tourism/presentation/screens/signup/signup.dart';
import 'package:tourism/presentation/screens/weather/weather.dart';
import 'package:tourism/presentation/screens/welcome_screen.dart';

import 'bussines_logic/cubits/cubit/cubit/activites_details_cubit.dart';
import 'bussines_logic/cubits/cubit/cubit/activites_list_cubit.dart';
import 'bussines_logic/cubits/cubit/cubit/cubit/city_details_cubit.dart';
import 'bussines_logic/cubits/cubit/cubit/cubit/cubit/rest_list_cubit.dart';
import 'bussines_logic/cubits/cubit/cubit/rest_details_cubit.dart';
import 'bussines_logic/cubits/cubit/offers_cubit.dart';
import 'const/const.dart';
import 'data/repository/activites_details_repository.dart';
import 'data/repository/activites_list_repository.dart';
import 'data/repository/city_details_repository.dart';
import 'data/repository/hotels_details_repository.dart';
import 'data/repository/offers_repository.dart';
import 'data/repository/rest_details_repository.dart';
import 'data/repository/rest_list_repository.dart';
import 'data/web_services/activites_list_web_services.dart';
import 'data/web_services/city_details_web_services.dart';
import 'data/web_services/hotels_details_web_services.dart';
import 'data/web_services/offers_web_services.dart';
import 'data/web_services/rest_list_web_services.dart';

class AppRoute {
  late HotelsDetailsCubit hotelsDetailsCubit;
  late HotelsDetailsRepository hotelsDetailsRepo;
  late HotelsListCubit hotelsListCubit;
  late HotelsListRepository hotelsListRepository;
  late RoomRepository roomRepository;
  late RoomCubit roomCubit;
  late WeatherBloc wetherBloc;
  late WeatherRepository weatherRepository;
  late CityGuideCubit cityGuideCubit;
  late CityGuideRepository cityGuideRepository;
  late ActivitesListCubit activitesListCubit;
  late ActivitesListRepository activitesListRepository;
  late ActivitesDetailsCubit activitesDetailsCubit;
  late ActivitesDetailsRepository activitesDetailsRepo;

  late CityDetailsCubit cityDetailsCubit;
  late CityDetailsRepository cityDetailsRepo;
  late RestListCubit restListCubit;
  late RestListRepository restListRepository;

  late RestDetailsCubit restDetailsCubit;
  late RestDetailsRepository restDetailsRepo;

  late ReserveCubit reserveCubit;
  late ReserveRepository reserveRepository;

  late MyReserveCubit myReserveCubit;
  late MyReserveRepository myReserveRepository;

  late OffersCubit offersCubit;
  late OffersRepository offersRepository;
  late TripTypeCubit tripTypeCubit;

  AppRoute() {
    hotelsDetailsRepo = HotelsDetailsRepository(HotelsDetailsWebServices());
    hotelsDetailsCubit = HotelsDetailsCubit(hotelsDetailsRepo);
    hotelsListRepository =
        HotelsListRepository(hotelsListWebServices: HotelsListWebServices());
    hotelsListCubit =
        HotelsListCubit(hotelsListRepository: hotelsListRepository);
    roomRepository = RoomRepository(roomWebServices: RoomWebServices());
    roomCubit = RoomCubit(roomRepository: roomRepository);
    wetherBloc = WeatherBloc(WeatherRepository());
    cityGuideRepository =
        CityGuideRepository(cityGuideWebServices: CityGuideWebServices());
    cityGuideCubit = CityGuideCubit(cityGuideRepository: cityGuideRepository);
    activitesListRepository = ActivitesListRepository(
        activitesListWebServices: ActivitesListWebServices());
    activitesListCubit =
        ActivitesListCubit(activitesListRepository: activitesListRepository);
    activitesDetailsRepo =
        ActivitesDetailsRepository(ActivitesDetailsWebServices());
    activitesDetailsCubit =
        ActivitesDetailsCubit(activitesDetailsRepository: activitesDetailsRepo);

    cityDetailsRepo = CityDetailsRepository(CityDetailsWebServices());
    cityDetailsCubit = CityDetailsCubit(cityDetailsRepository: cityDetailsRepo);
    restListRepository =
        RestListRepository(restListWebServices: RestListWebServices());
    restListCubit = RestListCubit(restListRepository: restListRepository);

    restDetailsRepo = RestDetailsRepository(RestDetailsWebServices());
    restDetailsCubit = RestDetailsCubit(restDetailsRepository: restDetailsRepo);
    reserveRepository =
        ReserveRepository(reserveWebServices: ReserveWebServices());

    reserveCubit = ReserveCubit(reserveRepository: reserveRepository);
    myReserveRepository =
        MyReserveRepository(myResrveWebServices: MyResrveWebServices());

    myReserveCubit = MyReserveCubit(myReserveRepository: myReserveRepository);

    offersRepository = OffersRepository(offersWebServices: OffersWebServices());

    offersCubit = OffersCubit(offersRepository: offersRepository);

    tripTypeCubit = TripTypeCubit();
  }

  Route? GenerateRoute(RouteSettings settings) {
    //the arguments we pass from page to page like bloc
    final args = settings.arguments;

    switch (settings.name) {
      case welcomePage:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const Login_Page());
      case home:
        return MaterialPageRoute(builder: (_) => Home());
      case signup:
        return MaterialPageRoute(builder: (_) => Signup_Page());
      case emailvri:
        return MaterialPageRoute(builder: (_) => Email_Virffcation_Page());
      case checkemail:
        return MaterialPageRoute(builder: (_) => CheckingEmail_Page());
      case resetpass:
        return MaterialPageRoute(builder: (_) => Reset_Password_Page());

      case account:
        return MaterialPageRoute(builder: (_) => Account_Page());

      case profil:
        return MaterialPageRoute(builder: (_) => My_Profile_Page());

      case update:
        return MaterialPageRoute(builder: (_) => Edit_Profile_Page());

      case cityDetails:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) => cityDetailsCubit,
            child: CityDetails(city: args as String),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      case weather:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) => wetherBloc,
            child: Weather(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      case restSearch:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const RestSearch(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      case offersSearch:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const OffersSearch(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      case comments:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              Comments_Pages(Name: args as String),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      case restList:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) => restListCubit,
            child: RestList(location: args as String),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      case flights:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) => TripTypeCubit(),
            child: const FlightsSearch(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      case offersList:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) => offersCubit,
            child: OffersList(hotelName: args as String),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      case restDetails:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => restDetailsCubit,
              ),
              // BlocProvider(
              //   create: (context) => roomCubit,
              // ),
            ],
            child: RestDetails(
              restName: args as String,
            ),
          ),
          // Replace with your HotelsDetails screen
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, -1.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      case generalSearch:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const GeneralSearch(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, -1.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      case hotelSearch:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const HotelsSearch(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      case myTrips:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const MyTrips(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      case hotelsList:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) => hotelsListCubit,
            child: HotelsList(location: args as String),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      case hotelsDetails:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => hotelsDetailsCubit,
              ),
              BlocProvider(
                create: (context) => roomCubit,
              ),
            ],
            child: HotelsDetails(
              hotelName: args as String,
            ),
          ),
          // Replace with your HotelsDetails screen
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: Offset(0.0, -1.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      case reserveHotel:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => reserveCubit,
              ),
            ],
            child: ReserveHotel(
              id: args as int,
            ),
          ),
          // Replace with your HotelsDetails screen
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: Offset(0.0, -1.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      case activitesSearch:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const ActivitesSearch(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      case activitesList:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) => activitesListCubit,
            child: ActivitesList(location: args as String),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      case activitesDetails:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => activitesDetailsCubit,
              ),
              // BlocProvider(
              //   create: (context) => roomCubit,
              // ),
            ],
            child: ActivitesDetails(
              location: args as String,
            ),
          ),
          // Replace with your HotelsDetails screen
          // transitionsBuilder: (context, animation, secondaryAnimation, child) {
          //   return SlideTransition(
          //     position: Tween<Offset>(
          //       begin: Offset(0.0, -1.0),
          //       end: Offset.zero,
          //     ).animate(animation),
          //     child: child,
          //   );
          // },
        );
    }
  }
}
