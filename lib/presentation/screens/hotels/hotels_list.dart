import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/bussines_logic/cubits/cubit/hotels_list_cubit.dart';

import 'package:tourism/presentation/widgets/custom_header.dart';
import 'package:tourism/presentation/widgets/hotels_list_widget/hotel_card.dart';

import '../../../const/const.dart';
import '../../../data/models/hotels_list_model.dart';
import '../../widgets/saving_container.dart';

class HotelsList extends StatefulWidget {
  const HotelsList({
    required this.location,
    Key? key,
  }) : super(key: key);

  final String location;

  @override
  State<HotelsList> createState() => _HotelsListState();
}

class _HotelsListState extends State<HotelsList> {
  late List<HotelsListModel> hotelsList;

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
    super.initState();
    BlocProvider.of<HotelsListCubit>(context).fetchHotelsList(widget.location);
  }

  Widget buildBlocWidget() {
    return BlocBuilder<HotelsListCubit, HotelsListState>(
      builder: (context, state) {
        if (state is HotelsListLoaded) {
          hotelsList = (state).hotelsList;
          return buildLoadedListWidget(hotelsList);
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

  Widget buildLoadedListWidget(List<HotelsListModel> hotelsList) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomHeader(
            title: 'Hotels',
            subtitle: '${hotelsList.length} Properties found',
          ),
          const Divider(color: Color(borderColors), height: 0.1),
          const SavingContainer(),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: hotelsList.length,
            itemBuilder: (context, index) {
              return HotelCard(
                hotel: hotelsList[index],
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
            BlocProvider.of<HotelsListCubit>(context).clearHotelsList();
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.location,
          style: const TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.wallet_travel_sharp,
                color: Color(kPrimaryColor)),
            onPressed: () {
              Navigator.pushReplacementNamed(context, myTrips);
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: buildBlocWidget(),
    );
  }
}
