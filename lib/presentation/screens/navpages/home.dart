import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:tourism/bussines_logic/bloc/bloc/my_profile_bloc_bloc.dart";
import "package:tourism/bussines_logic/cubits/cubit/my_reserve_cubit.dart";
import "package:tourism/data/repository/my_reserve_repository.dart";
import "package:tourism/data/web_services/my_reserve_web_services.dart";
import "package:tourism/presentation/screens/navpages/home_page.dart";
import "package:tourism/presentation/screens/navpages/my_profile.dart";
import "package:tourism/presentation/screens/navpages/my_trips.dart";

import "../../../bussines_logic/cubits/cubit/cubit/city_guide_cubit.dart";
import "../../../const/const.dart";
import "../../../data/models/city.dart";
import "../../../data/models/city_guide.dart";
import "../../../data/models/main_categories.dart";
import "../../widgets/home_page_widgets/category_card_builder.dart";
import "../../widgets/home_page_widgets/city_card_builder.dart";
import "../../widgets/home_page_widgets/header.dart";
import "../../widgets/home_page_widgets/home_text.dart";
import "../../widgets/home_page_widgets/ideas_card.dart";
import "account.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List pages = [
    //HomeScreen(),
    const HomePage(),
     MyTrips(),
    Account_Page(),
  ];
  int currentIndex = 0;
  onTap(int index) {
    MyReserveCubit(
            myReserveRepository:
                MyReserveRepository(myResrveWebServices: MyResrveWebServices()))
        .fetchMyReserve();
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      //appBar: buildAppBar(),
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            border: Border(
                top: BorderSide(
          color: Color(lightGrey),
          width: 1,
        ))),
        child: BottomNavigationBar(
          backgroundColor: /*Color(0xFF005B9F),*/ Colors.white,
          onTap: onTap,
          currentIndex: currentIndex,
          selectedItemColor: Color(kPrimaryColor),
          unselectedItemColor: Color(0xFFB3000000),
          showUnselectedLabels: true,
          showSelectedLabels: true,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: "My Trips", icon: Icon(Icons.wallet_travel)),
            BottomNavigationBarItem(
                label: "Profile", icon: Icon(Icons.account_circle)),
          ],
        ),
      ),
      body: pages[currentIndex],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      //!Set the color of the menu icon
      leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          )),
      actions: [
        IconButton(
          icon: Icon(Icons.attach_money),
          onPressed: () {},
        ),
      ],
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

Future<void> handleRefresh() async {
  // reloading data
  return await Future.delayed(const Duration(seconds: 2));
}

class _HomePageState extends State<HomePage> {
  late List<CityGuide> cityGuideList;

  @override
  void didChangeDependencies() {
    precacheImage(const AssetImage("assets/images/offers.jpg"), context);
    precacheImage(const AssetImage("assets/images/newweather2.jpg"), context);

    precacheImage(const AssetImage("assets/images/rest2.jpg"), context);
    precacheImage(const AssetImage("assets/images/surfing.jpg"), context);
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void initState() {
    BlocProvider.of<CityGuideCubit>(context).getAllCity();
    // TODO: implement initState

    super.initState();
  }

  Widget buildBlocWidget(Size size) {
    return BlocBuilder<CityGuideCubit, CityGuideState>(
      builder: (context, state) {
        if (state is CityGuideLoaded) {
          cityGuideList = (state).cityGuideList;
          return CityCardBuilder(
            size: size,
            cityList: cityGuideList,
          );
        } else {
          print("helooo rami");
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget showLoadingIndicator() {
    return Center(
      child: Image.asset('assets/images/loading1.gif'),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Categorys> catList = Categorys.Cat;
    //List<City> cityList = City.cities;

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: SingleChildScrollView(
        // physics: ScrollPhysics(parent: BouncingScrollPhysics()),
        child: Column(
          children: <Widget>[
            Header(
              size: size,
              circDg: 36,
              imgHeader: "assets/images/surfing.jpg",
            ),
            CatsBuilder(size: size, catList: catList),
            const HomeText(text: "Explore Your Destination"),
            buildBlocWidget(size),
            const HomeText(text: "Ideas for your next trip"),
            IdeasCard(
                id: 1,
                size: size,
                img: "assets/images/rest2.jpg",
                title: "Explore the Best Restaurants in your destination",
                desc:
                    "Satisfy your cravings and taste buds with the most delicious food in your vication city"),
            IdeasCard(
                id: 2,
                size: size,
                img: "assets/images/newweather2.jpg",
                title: "Search the weather for your next destinations",
                desc:
                    "There's a whole lot of world out there. Go see more of it's wonders"),
            IdeasCard(
                id: 3,
                size: size,
                img: "assets/images/offers.jpg",
                title: "Your downtime just got better",
                desc:
                    "Go from no plans to a weekend away and save 10% or more with our offers "),
          ],
        ),
      ),
    );
  }
}
