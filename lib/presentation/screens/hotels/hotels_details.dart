// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:tourism/bussines_logic/cubits/cubit/hotels_details_cubit.dart';
// import 'package:tourism/data/models/hotels_details_model.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:tourism/presentation/widgets/custom_header.dart';
// import '../../../bussines_logic/cubits/cubit/room_cubit.dart';
// import '../../../const/const.dart';
// import '../../../data/models/room_model.dart';
// import '../../widgets/hotels_details_widgets/image_header.dart';
// import '../../widgets/hotels_details_widgets/loaded_details_widget.dart';
// import '../../widgets/hotels_details_widgets/room_card.dart';
// import '../../widgets/hotels_details_widgets/vip_container.dart';

// class HotelsDetails extends StatefulWidget {
//   const HotelsDetails({
//     Key? key,
//     required this.hotelName,
//   }) : super(key: key);
//   final String hotelName;

//   @override
//   State<HotelsDetails> createState() => _HotelsDetailsState();
// }

// class _HotelsDetailsState extends State<HotelsDetails> {
//   bool isLiked = false;
//   late List<RoomModel> roomList;
//   final PageController _pageController = PageController();
//   @override
//   void dispose() {
//     // Dispatch the event to reset the Cubit's state
//     BlocProvider.of<HotelsDetailsCubit>(context).reset();
//     BlocProvider.of<RoomCubit>(context).reset();
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   void initState() {
//     super.initState();
//     BlocProvider.of<HotelsDetailsCubit>(context)
//         .fetchHotelDetails(widget.hotelName);
//     BlocProvider.of<RoomCubit>(context).fetchRooms(widget.hotelName);
//   }

//   Widget buildBlocWidget() {
//     return BlocBuilder<HotelsDetailsCubit, HotelsDetailsState>(
//       builder: (context, state) {
//         if (state is HotelsDetailsLoaded  ) {
//           final hoteldetails = (state).hotelDetails;
//           return LoadedDetailsWidget(
//             hotelDetails: hoteldetails,
//             pageController: _pageController,
//           );
//         } else {
//           return showLoadingIndicator();
//         }
//       },
//     );
//   }

//   Widget buildRoomBlocWidget() {
//     return BlocBuilder<RoomCubit, RoomState>(
//       builder: (context, state) {
//         if (state is RoomLoaded) {
//           roomList = state.roomList;
//           if (roomList.isEmpty) {
//             return Text("there is no availble rooms");
//           }
//           else{ return buildLoadedListWidget(roomList);}

//         } else {
//           return showLoadingIndicator();
//         }
//       },
//     );
//   }

//   Center showLoadingIndicator() {
//     return Center(
//       child: Image.asset('assets/images/loading1.gif'),
//     );
//   }

//   Widget buildLoadedListWidget(List<RoomModel> roomList) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ListView.builder(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: roomList.length,
//             itemBuilder: (context, index) {
//               return RoomCard(room: roomList[index]);
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         bottom: const PreferredSize(
//           preferredSize: Size.fromHeight(0.1),
//           child: Divider(color: Color(borderColors), height: 0.1),
//         ),
//         leading: BackButton(
//           color: const Color(kPrimaryColor),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(
//               isLiked ? Icons.favorite : Icons.favorite_border,
//               color: isLiked ? Colors.red : Colors.grey,
//             ),
//             onPressed: () {
//               setState(() {
//                 isLiked = !isLiked;
//               });
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(children: [
//           buildBlocWidget(),
//           Row(
//             children: [
//               SizedBox(
//                 width: 8,
//               ),
//               CustomHeader(
//                 title: "Select a Room",
//               ),
//             ],
//           ),
//           buildRoomBlocWidget(),
//         ]),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/bussines_logic/cubits/cubit/hotels_details_cubit.dart';
import 'package:tourism/data/models/hotels_details_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tourism/presentation/widgets/custom_header.dart';
import '../../../bussines_logic/cubits/cubit/room_cubit.dart';
import '../../../const/const.dart';
import '../../../data/models/room_model.dart';
import '../../widgets/hotels_details_widgets/image_header.dart';
import '../../widgets/hotels_details_widgets/loaded_details_widget.dart';
import '../../widgets/hotels_details_widgets/room_card.dart';
import '../../widgets/hotels_details_widgets/vip_container.dart';

class HotelsDetails extends StatefulWidget {
  const HotelsDetails({
    Key? key,
    required this.hotelName,
  }) : super(key: key);
  final String hotelName;

  @override
  State<HotelsDetails> createState() => _HotelsDetailsState();
}

class _HotelsDetailsState extends State<HotelsDetails> {
  bool isLiked = false;
  late List<RoomModel> roomList;
  final PageController _pageController = PageController();

  // Track the loading state of Cubits
  bool _isHotelsDetailsLoaded = false;
  bool _isRoomLoaded = false;

  @override
  void initState() {
    super.initState();
    final hotelsDetailsCubit = BlocProvider.of<HotelsDetailsCubit>(context);
    final roomCubit = BlocProvider.of<RoomCubit>(context);

    hotelsDetailsCubit.fetchHotelDetails(widget.hotelName);
    roomCubit.fetchRooms(widget.hotelName);

    hotelsDetailsCubit.stream.listen((state) {
      if (state is HotelsDetailsLoaded) {
        setState(() {
          _isHotelsDetailsLoaded = true;
        });
      }
    });

    roomCubit.stream.listen((state) {
      if (state is RoomLoaded) {
        setState(() {
          _isRoomLoaded = true;
        });
      }
    });
  }

  Widget buildBlocWidget() {
    return BlocBuilder<HotelsDetailsCubit, HotelsDetailsState>(
      builder: (context, state) {
        if (state is HotelsDetailsLoaded && _isRoomLoaded) {
          final hoteldetails = (state).hotelDetails;
          return LoadedDetailsWidget(
            hotelDetails: hoteldetails,
            pageController: _pageController,
          );
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget buildRoomBlocWidget() {
    return BlocBuilder<RoomCubit, RoomState>(
      builder: (context, state) {
        if (state is RoomLoaded && _isHotelsDetailsLoaded) {
          roomList = state.roomList;
          if (roomList.isEmpty) {
            return Text("there is no available rooms");
          } else {
            return buildLoadedListWidget(roomList);
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

  Widget buildLoadedListWidget(List<RoomModel> roomList) {
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
                title: "Select a Room",
                size: 20,
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: roomList.length,
            itemBuilder: (context, index) {
              return RoomCard(room: roomList[index]);
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
        actions: [
          IconButton(
            icon: Icon(
              isLiked ? Icons.favorite : Icons.favorite_border,
              color: isLiked ? Colors.red : Colors.grey,
            ),
            onPressed: () {
              setState(() {
                isLiked = !isLiked;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          buildBlocWidget(),
          buildRoomBlocWidget(),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, comments,
                    arguments: widget.hotelName);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(kPrimaryColor),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0))),
              child: Text(
                "Comments",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.white,
                    ),
              ))
        ]),
      ),
    );
  }
}
