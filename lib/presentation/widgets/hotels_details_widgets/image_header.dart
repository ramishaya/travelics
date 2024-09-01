// import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// import '../../../const/const.dart';
// import '../../../data/models/hotels_details_model.dart';

// class ImageHeader extends StatelessWidget {
//   const ImageHeader({
//     Key? key,
//     required PageController pageController,
//     required this.imageCount,
//     required this.hotelDetails,
//   }) : _pageController = pageController;

//   final PageController _pageController;
//   final int imageCount;
//   final HotelsDetailsModel hotelDetails;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 200,
//       child: Stack(
//         children: [
//           PageView.builder(
//             scrollDirection: Axis.horizontal,
//             controller: _pageController,
//             itemCount: imageCount,
//             itemBuilder: (context, index) {
//               final imageUrl = hotelDetails.images[index];
//               return Image.asset(
//                 imageUrl,
//                 fit: BoxFit.cover,
//               );
//             },
//           ),
//           Positioned(
//             bottom: 16,
//             left: 100,
//             right: 0,
//             child: AnimatedBuilder(
//               animation: _pageController,
//               builder: (context, child) {
//                 return SmoothPageIndicator(
//                   controller: _pageController,
//                   count: imageCount,
//                   effect: const WormEffect(
//                     activeDotColor: Color(kPrimaryColor),
//                     dotColor: Colors.grey,
//                     dotWidth: 10,
//                     dotHeight: 10,
//                     spacing: 8,
//                     radius: 10,
//                     paintStyle: PaintingStyle.fill,
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// import '../../../const/const.dart';
// import '../../../data/models/hotels_details_model.dart';

// class ImageHeader extends StatelessWidget {
//   const ImageHeader({
//     Key? key,
//     required PageController pageController,
//     required this.imageCount,
//     required this.hotelDetails,
//   }) : _pageController = pageController;

//   final PageController _pageController;
//   final int imageCount;
//   final HotelsDetailsModel hotelDetails;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 200,
//       child: Stack(
//         children: [
//           PageView.builder(
//             scrollDirection: Axis.horizontal,
//             controller: _pageController,
//             itemCount: imageCount,
//             itemBuilder: (context, index) {
//               final imageUrl = hotelDetails.images[index];
//               return Image.asset(
//                 imageUrl,
//                 fit: BoxFit.cover,
//               );
//             },
//           ),
//           Positioned(
//             bottom: 16,
//             left: 0,
//             right: 0,
//             child: AnimatedBuilder(
//               animation: _pageController,
//               builder: (context, child) {
//                 // Calculate equidistant padding for the dots
//                 final double screenWidth = MediaQuery.of(context).size.width;
//                 final double dotWidth = 10;
//                 final double dotSpacing = 8;
//                 final double totalDotsWidth = (imageCount * dotWidth) +
//                     ((imageCount - 1) * dotSpacing);
//                 final double leftPadding = (screenWidth - totalDotsWidth) / 2;

//                 return Padding(
//                   padding: EdgeInsets.only(left: leftPadding),
//                   child: SmoothPageIndicator(
//                     controller: _pageController,
//                     count: imageCount,
//                     effect: const WormEffect(
//                       activeDotColor: Color(kPrimaryColor),
//                       dotColor: Colors.grey,
//                       dotWidth: 10,
//                       dotHeight: 10,
//                       spacing: 8,
//                       radius: 10,
//                       paintStyle: PaintingStyle.fill,
//                     ),
//                     onDotClicked: (index) {
//                       _pageController.animateToPage(
//                         index,
//                         duration: Duration(milliseconds: 500),
//                         curve: Curves.ease,
//                       );
//                     },
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../const/const.dart';
import '../../../data/models/hotels_details_model.dart';

class ImageHeader extends StatelessWidget {
  const ImageHeader({
    Key? key,
    required PageController pageController,
    required this.imageCount,
    required this.hotelDetails,
  }) : _pageController = pageController;

  final PageController _pageController;
  final int imageCount;
  final HotelsDetailsModel hotelDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            itemCount: imageCount,
            itemBuilder: (context, index) {
              final imageUrl = hotelDetails.images[index];
              return imageUrl!.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.25,
                      placeholder: "assets/images/loading1.gif",
                      image: imageUrl!)
                  : Image.asset(
                      "assets/images/loading1.gif",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.25,
                    );
            },
          ),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: 20, // Adjust the height as needed
                child: AnimatedBuilder(
                  animation: _pageController,
                  builder: (context, child) {
                    return SmoothPageIndicator(
                      controller: _pageController,
                      count: imageCount,
                      effect: const WormEffect(
                        activeDotColor: Color(kPrimaryColor),
                        dotColor: Colors.grey,
                        dotWidth: 10,
                        dotHeight: 10,
                        spacing: 8,
                        radius: 10,
                        paintStyle: PaintingStyle.fill,
                      ),
                      onDotClicked: (index) {
                        _pageController.animateToPage(
                          index,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
