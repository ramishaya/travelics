// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:tourism/const/const.dart';
import 'package:tourism/data/models/activites.dart';
import 'package:tourism/data/models/activites_list_model.dart';

import '../../../bussines_logic/cubits/cubit/cubit/activites_list_cubit.dart';
import '../../../bussines_logic/cubits/cubit/hotels_list_cubit.dart';
import '../../widgets/custom_header.dart';

class ActivitesList extends StatefulWidget {
  const ActivitesList({
    required this.location,
    Key? key,
  }) : super(key: key);
  final String location;

  @override
  State<ActivitesList> createState() => _ActivitesListState();
}

class _ActivitesListState extends State<ActivitesList> {
  late List<ActivitesListModel> activitesList;
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ActivitesListCubit>(context)
        .fetchActivitesList(widget.location);
  }

  Widget buildBlocWidget(double width) {
    return BlocBuilder<ActivitesListCubit, ActivitesListState>(
      builder: (context, state) {
        if (state is ActivitesListLoaded) {
          activitesList = (state).activitesList;
          return buildLoadedListWidget(
            activitesList,
            width,
          );
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget buildLoadedListWidget(
    List<ActivitesListModel> activitesList,
    double width,
  ) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CustomHeader(
          title: "Activites",
          subtitle: "Things to do in ${widget.location}",
        ),
        _ActivitesMasonryGrid(
          location: widget.location,
          activites: activitesList,
          width: width,
        )
      ]),
    );
  }

  Center showLoadingIndicator() {
    return Center(
      child: Image.asset('assets/images/loading1.gif'),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0.1),
            child: Container(color: const Color(borderColors), height: 0.1),
          ),
          leading: BackButton(
            color: const Color(kPrimaryColor),
            onPressed: () {
              BlocProvider.of<ActivitesListCubit>(context).clearActivitesList();
              Navigator.pop(context);
            },
          ),
          title: Text(
            widget.location,
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search, color: Color(kPrimaryColor)),
              onPressed: () {
                BlocProvider.of<ActivitesListCubit>(context)
                    .clearActivitesList();
                Navigator.pop(context);
              },
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: buildBlocWidget(width));
  }
}

class _ActivitesMasonryGrid extends StatefulWidget {
  const _ActivitesMasonryGrid(
      {Key? key,
      required this.width,
      this.masonryCardHeights = const [200, 250, 300],
      required this.activites,
      required this.location})
      : super(key: key);

  final List<ActivitesListModel> activites;
  final List<double> masonryCardHeights;
  final double width;
  final String location;

  @override
  _ActivitesMasonryGridState createState() => _ActivitesMasonryGridState();
}

class _ActivitesMasonryGridState extends State<_ActivitesMasonryGrid> {
  List<bool> isFavoriteList = List<bool>.filled(9, false);

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(9.0),
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      itemCount: widget.activites.length,
      itemBuilder: (context, index) {
        ActivitesListModel activity = widget.activites[index];
        bool isFavorite = isFavoriteList[index];
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, activitesDetails,
                arguments: activity.name);
          },
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Hero(
                      tag: '${activity.rate}_${activity.name}',
                      child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(15.0),
                            bottom: Radius.circular(15.0),
                          ),
                          child: activity.imageProfile!.isNotEmpty
                              ? FadeInImage.assetNetwork(
                                  fit: BoxFit.cover,
                                  height: widget.masonryCardHeights[index % 3],
                                  placeholder: "assets/images/loading1.gif",
                                  image:
                                      activity.imageProfile!)
                              : Image.asset(
                                  "assets/images/loading1.gif",
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: widget.masonryCardHeights[index % 3],
                                ))),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            isFavoriteList[index] = !isFavorite;
                          });
                        },
                        icon: Icon(
                          isFavorite
                              ? Icons.favorite
                              : Icons.favorite_outline_outlined,
                          color: isFavorite ? Colors.red : null,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10, // Adjust the values as needed
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 3.0,
                        horizontal: 3.0,
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
                          Text(
                            '${activity.rate}/5',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 4.0),
                          const Text(
                            'User Reviews',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Text(
                    activity.name!,
                    maxLines: 3,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
