import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/bussines_logic/cubits/cubit/my_reserve_cubit.dart';

import '../../../bussines_logic/cubits/cubit/my_reserve_state.dart';
import '../../../const/const.dart';
import '../../widgets/custom_header.dart';
import '../../widgets/saving_container.dart';

class MyTrips extends StatefulWidget {
  const MyTrips({super.key});

  @override
  State<MyTrips> createState() => _MyTripsState();
}

class _MyTripsState extends State<MyTrips> {
  late List<dynamic> hotelres;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<MyReserveCubit>(context).fetchMyReserve();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<MyReserveCubit, MyReserveState>(
      builder: (context, state) {
        if (state is MyReserveLoaded) {
          hotelres = (state).hotels;
          return buildLoadedListWidget(hotelres);
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

  Widget buildLoadedListWidget(List<dynamic> hotelres) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomHeader(
            title: 'My Offers',
            subtitle: '${hotelres.length} Reserves found',
          ),
          const Divider(color: Color(borderColors), height: 0.1),
          const SavingContainer(),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: hotelres.length,
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: const BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                elevation: 2,
                margin: const EdgeInsets.only(
                  bottom: 14,
                  left: kDefaultPadding,
                  right: kDefaultPadding,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            hotelres[index].name!,
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          const SizedBox(height: 8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Align the text and icon to the start
                            children: [
                              const Icon(Icons.hotel,
                                  size: 20, color: Colors.grey),
                              const SizedBox(
                                  width:
                                      3.0), // Add some spacing between the icon and text
                              Expanded(
                                child: Text(
                                  hotelres[index].type!,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Align the text and icon to the start
                            children: [
                              const Icon(Icons.timer,
                                  size: 20, color: Colors.grey),
                              const SizedBox(
                                  width:
                                      3.0), // Add some spacing between the icon and text
                              Expanded(
                                child: Text(
                                 "Check in    : ${hotelres[index].checkIn!}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                   // fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Align the text and icon to the start
                            children: [
                              const Icon(Icons.timer,
                                  size: 20, color: Colors.grey),
                              const SizedBox(width: 3.0),
                              // Add some spacing between the icon and text
                              Expanded(
                                child: Text(
                                  "Check out : ${hotelres[index].checkOut!}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                     // fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.pushReplacementNamed(context, home);
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(0.1),
              child: Divider(color: Color(borderColors), height: 0.1),
            ),
            title: Text(
              "Reserves",
              style: const TextStyle(color: Colors.black),
            ),
          ),
          backgroundColor: Colors.white,
          body: buildBlocWidget(),
        ));
  }
}
