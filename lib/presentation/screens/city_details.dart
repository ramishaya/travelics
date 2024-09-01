import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tourism/bussines_logic/cubits/cubit/cubit/cubit/city_details_cubit.dart';
import 'package:tourism/presentation/widgets/hotels_details_widgets/vip_container.dart';

import '../../const/const.dart';

import '../../data/models/city_details_model.dart';

class CityDetails extends StatefulWidget {
  final String city;
  const CityDetails({super.key, required this.city});

  @override
  State<CityDetails> createState() => _CityDetailsState();
}

class _CityDetailsState extends State<CityDetails> {
  // @override
  // void dispose() {

  //   //_pageController.dispose();
  //   //super.dispose();
  // }

  @override
  void didChangeDependencies() {
        

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    BlocProvider.of<CityDetailsCubit>(context).reset();
  }

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<CityDetailsCubit>(context).fetchCityDetails(widget.city);

    super.initState();
  }

  //final PageController _pageController = PageController();
  // final GlobalKey<dynamic> _scrollViewKey = GlobalKey();
  //City cityList = City.cities[0];

  Widget buildBlocWidget() {
    return BlocBuilder<CityDetailsCubit, CityDetailsState>(
      builder: (context, state) {
        if (state is CityDetailsLoaded) {
          final citydetails = (state).cityDetails;
          return loadedDetailsWidget(citydetails);
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget loadedDetailsWidget(CityDetailsModel city) {
    return CustomScrollView(
      slivers: [
        buildSliverAppBar(city),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
            margin: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                VipContainer(title: "Travel Guide"),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  city.name!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'About the city:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  city.description!,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          )
        ])),
      ],
    );
  }

  Center showLoadingIndicator() {
    return Center(
      child: Image.asset('assets/images/loading1.gif'),
    );
  }

  Widget buildSliverAppBar(CityDetailsModel city) {
    return SliverAppBar(
      expandedHeight: 600,
      stretch: true,
      pinned: true,
      leading: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: IconButton(
          key: Key('backButton'),
          onPressed: () {
            BlocProvider.of<CityDetailsCubit>(context).reset();
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Color(kPrimaryColor),
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        // centerTitle: true,

        background: Image.network(
          city.imageProfile!,
          fit: BoxFit.cover,
        ),

        //Image.asset(cityList.image[0],fit: BoxFit.cover,)
        // Image.asset("assets/images/loading.gif")
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildBlocWidget());
  }
}
