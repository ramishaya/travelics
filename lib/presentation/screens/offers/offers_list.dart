import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bussines_logic/cubits/cubit/offers_cubit.dart';
import '../../../const/const.dart';
import '../../widgets/custom_header.dart';

class OffersList extends StatefulWidget {
  const OffersList({super.key, required this.hotelName});
  final String hotelName;
  @override
  State<OffersList> createState() => _OffersListState();
}

class _OffersListState extends State<OffersList> {
  late List<dynamic> offersList;
  
  @override
  void initState() {
    
    final offersCubit = BlocProvider.of<OffersCubit>(context);

     
    offersCubit.fetchOffers(widget.hotelName);
    // TODO: implement initState
    super.initState();
  }

  Widget buildOffreslocWidget() {
    return BlocBuilder<OffersCubit, OffersState>(
      builder: (context, state) {
        if (state is OffersLoaded ) {
          offersList = state.offersList;
          if (offersList.isEmpty) {
            return Text("there is no available offers");
          } else {
            return buildLoadedListWidget(offersList);
          }
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
   Widget buildLoadedListWidget(List<dynamic> offersList) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 8,
              ),
              CustomHeader(
                title: "Select an offer Room",
                size:20,
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: offersList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
      onTap: () {
       // print(room.type);

        // Navigator.pushNamed(
        //   context,
        //   hotelsDetails,
        //   arguments: hotel.name,
        // );
      },
      child: Card(
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
            Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20.0),
                    ),
                    child: offersList[index].image!.isNotEmpty
                        ? FadeInImage.assetNetwork(
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.25,
                            placeholder: 'assets/images/loading1.gif',
                            image: offersList[index].image!)
                        : Image.asset(
                            'assets/images/loading1.gif',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.25,
                          )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    offersList[index].type!,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "Details",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment
                        .start, // Align the text and icon to the start
                    children: [
                      // Add some spacing between the icon and text
                      Icon(
                        Icons.info,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          offersList[index].description!,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        child: Icon(
                          Icons.money_sharp,
                          // Additional icon properties...
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "old price ${offersList[index].oldPrice}",
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 16,
                            color: Colors.black,
                            // Additional text style properties...
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4.0,
                          horizontal: 8.0,
                        ),
                        decoration: const BoxDecoration(
                          color: Color(kPrimaryColor),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8.0),
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 4.0),
                            const Text(
                              'New Price :',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              // ignore: prefer_adjacent_string_concatenation
                              '${offersList[index].newPrice}' + "\$",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, reserveHotel,
                                arguments: offersList[index].id);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(kPrimaryColor),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0))),
                          child: Text(
                            "Book now",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Colors.white,
                                    ),
                          ))
                    ],
                  ),
                  const SizedBox(height: 8.0),
                ],
              ),
            ),
          ],
        ),
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
            Navigator.pop(context);
          },
        ),
        
      ),
      body: SingleChildScrollView(
        child: Column(children: [
        
          buildOffreslocWidget(),
        ]),
      ),
    );
  }
}
