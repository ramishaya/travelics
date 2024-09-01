import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tourism/presentation/screens/flights/flight_search.dart';

import '../../../const/const.dart';
import '../../../data/models/main_categories.dart';

class CatsBuilder extends StatefulWidget {
  const CatsBuilder({
    super.key,
    required this.size,
    required this.catList,
  });

  final Size size;
  final List<Categorys> catList;

  @override
  State<CatsBuilder> createState() => _CatsBuilderState();
}

class _CatsBuilderState extends State<CatsBuilder> {
  @override
  void didChangeDependencies() {
    precacheImage(const AssetImage("assets/images/hotel10.jpg"), context);
    precacheImage(const AssetImage("assets/images/flight.jpg"), context);
    precacheImage(const AssetImage("assets/images/acti2.jpg"), context);
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  List images = [
    "assets/images/hotel10.jpg",
    "assets/images/flight.jpg",
    "assets/images/acti2.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: kDefaultPadding,
          right: kDefaultPadding,
          bottom: kDefaultPadding),
      child: SizedBox(
          height: widget.size.height * 0.12,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
              itemCount: widget.catList.length,
              itemBuilder: (context, index) {
                return CatCard(
                  size: widget.size,
                  catList: widget.catList,
                  index: index,
                  images: images,
                );
              })),
    );
  }
}

class CatCard extends StatelessWidget {
  CatCard({
    super.key,
    required this.size,
    required this.catList,
    required this.index,
    required this.images,
  });

  final Size size;
  final List<Categorys> catList;
  final int index;
  List<dynamic> images;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //! here you navigate to the search screen
        if (index == 0) {
          print("goo");
          Navigator.pushNamed(context, hotelSearch);
        }
        if (index == 1) {
          Navigator.pushNamed(context, flights);
          print("rami");
        }
        if (index == 2) {
          print("diloo");
          Navigator.pushNamed(context, activitesSearch);
        }
      },
      child: Container(
        margin: EdgeInsets.only(right: 29),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
                width: size.width * 0.24,
                decoration: BoxDecoration(
                    // border: Border.all(color:Color(0xFF333333),width: 1),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(images[index]), fit: BoxFit.cover))),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                // margin: EdgeInsets.only(bottom: 10),

                height: 30,
                width: size.width * 0.19,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withOpacity(0.4),
                          Colors.white.withOpacity(0.1),
                        ])),
                child: Stack(
                  //  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white.withOpacity(0.2)),
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.white.withOpacity(0.4),
                                  Colors.white.withOpacity(0.1),
                                ])),
                      ),
                    ),
                    Container(
                      //margin: EdgeInsets.only(bottom: 10),
                      // height: 60,
                      //width: size.width * 0.19,
                      decoration: BoxDecoration(
                        // border: Border.all(color: Colors.white.withOpacity(0.2)),
                        borderRadius: BorderRadius.circular(10),
                        // gradient: LinearGradient(
                        //   begin: Alignment.topLeft,
                        //    end: Alignment.bottomRight,
                        //    colors: [
                        //     Colors.white.withOpacity(0.4),
                        //      Colors.white.withOpacity(0.1),
                        //    ]
                        // )
                      ),
                    ),
                    Center(
                      child: Text(
                        catList[index].title,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
