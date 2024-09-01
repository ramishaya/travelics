import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tourism/const/const.dart';

import 'package:tourism/data/models/activites_details_model.dart';

import '../../../bussines_logic/cubits/cubit/cubit/activites_details_cubit.dart';

import '../../widgets/clipped_container.dart';

class ActivitesDetails extends StatefulWidget {
  const ActivitesDetails({required this.location});

  final String location;

  @override
  State<ActivitesDetails> createState() => _ActivitesDetailsState();
}

class _ActivitesDetailsState extends State<ActivitesDetails> {
  final PageController _pageController = PageController();


  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<ActivitesDetailsCubit>(context)
        .fetchActivitesDetails(widget.location);
    super.initState();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<ActivitesDetailsCubit, ActivitesDetailsState>(
      builder: (context, state) {
        if (state is ActivitesDetailsLoaded) {
          final activitesdetails = (state).activitesDetails;
          return loadedDetailsWidget(
            activitesdetails,
            _pageController,
          );
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

  Widget loadedDetailsWidget(
      ActivitesDetailsModel activites, PageController pageController) {
    return Column(
      children: [
        _ActivityImage(activity: activites, pageController: pageController),
        _ActivityInformation(activity: activites),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white, child: buildBlocWidget());
  }
}

class _ActivityInformation extends StatelessWidget {
  const _ActivityInformation({super.key, required this.activity});
  final ActivitesDetailsModel activity;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            activity.name!,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
         
          const SizedBox(
            height: 10,
          ),
         Row(
          mainAxisAlignment: MainAxisAlignment.start,
           children: [
            Icon(Icons.location_on,),
             Expanded(
               child: Text(
                  activity.address!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
             ),
           ],
         ),
          // RatingBar.builder(
          //     initialRating: activity.rate!,
          //     minRating: 0,
          //     direction: Axis.horizontal,
          //     ignoreGestures: true,
          //     itemCount: 5,
          //     itemSize: 20,
          //     itemBuilder: (context, _) => const Icon(
          //           Icons.star,
          //           color: Colors.amber,
          //         ),
          //     onRatingUpdate: (rating) {}),
          const SizedBox(
            height: 20,
          ),
          Text(
            "about : ",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            activity.description!,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$200',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(kPrimaryColor),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0))),
                  child: Text(
                    "Book now",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                        ),
                  ))
            ],
          )
        ]),
      ),
    );
  }
}

class _ActivityImage extends StatelessWidget {
  const _ActivityImage(
      {super.key, required this.activity, required this.pageController});
  final PageController pageController;
  final ActivitesDetailsModel activity;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          ClippedContainer(
              activity: activity,
              imgesURL: activity.images,
              cont: pageController,
              id: 1),
        ],
      ),
      Hero(
        tag: '${activity.rate}_${activity.name}',
        child: ClippedContainer(
            activity: activity,
            imgesURL: activity.images,
            cont: pageController,
            id: 2),
      ),
    ]);
  }
}
