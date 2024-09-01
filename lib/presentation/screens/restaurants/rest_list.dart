import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/bussines_logic/cubits/cubit/hotels_list_cubit.dart';
import 'package:tourism/data/models/hotels.dart';
import 'package:tourism/presentation/screens/navpages/my_trips.dart';
import 'package:tourism/presentation/widgets/custom_header.dart';
import 'package:tourism/presentation/widgets/hotels_list_widget/hotel_card.dart';

import '../../../bussines_logic/cubits/cubit/cubit/cubit/cubit/rest_list_cubit.dart';
import '../../../const/const.dart';
import '../../../data/models/hotels_list_model.dart';
import '../../../data/models/rest_list_model.dart';
import '../../widgets/rest_widgets/rest_card.dart';
import '../../widgets/saving_container.dart';

class RestList extends StatefulWidget {
  const RestList({
    required this.location,
    Key? key,
  }) : super(key: key);

  final String location;

  @override
  State<RestList> createState() => _RestListState();
}

class _RestListState extends State<RestList> {
  late List<RestListModel> restList;

  List<String> favoriteHotels = [];

  void toggleFavorite(String hotelId) {
    setState(() {
      if (favoriteHotels.contains(hotelId)) {
        favoriteHotels.remove(hotelId);
      } else {
        favoriteHotels.add(hotelId);
      }
    });
  }

  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<RestListCubit>(context).fetchRestList(widget.location);
  }


  Widget buildBlocWidget() {
    return BlocBuilder<RestListCubit, RestListState>(
      builder: (context, state) {
        if (state is RestListLoaded) {
          restList = (state).restList;
          return buildLoadedListWidget(restList);
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Center showLoadingIndicator() {
    return Center(
      child: Image.asset('assets/images/loading1.gif'),
    );
  }

  Widget buildLoadedListWidget(List<RestListModel>restList) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomHeader(
            title: 'Restaurants',
            subtitle: '${restList.length} Restaurants found',
          ),
          const Divider(color: Color(borderColors), height: 0.1),
          const SavingContainer(),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: restList.length,
            itemBuilder: (context, index) {
              return RestCard(
                rest: restList[index],
                location: widget.location,
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(0.1),
          child: Divider(color: Color(borderColors), height: 0.1),
        ),
        leading: BackButton(
          color: const Color(kPrimaryColor),
          onPressed: () {
            BlocProvider.of<RestListCubit>(context).clearRestList();
           Navigator.pop(context);
          },
        ),
        title: Text(
          widget.location,
          style: const TextStyle(color: Colors.black),
        ),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.wallet_travel_sharp,
        //         color: Color(kPrimaryColor)),
        //     onPressed: () {
        //       Navigator.pushReplacementNamed(context, myTrips);
        //     },
        //   ),
        // ],
      ),
      backgroundColor: Colors.white,
      body: buildBlocWidget(),
    );
  }
}
