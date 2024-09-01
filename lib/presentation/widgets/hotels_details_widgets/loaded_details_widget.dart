

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourism/presentation/widgets/hotels_details_widgets/vip_container.dart';

import '../../../data/models/hotels_details_model.dart';
import 'image_header.dart';

class LoadedDetailsWidget extends StatelessWidget{
  final HotelsDetailsModel hotelDetails;
  final PageController pageController;

  const LoadedDetailsWidget({
    required this.hotelDetails,
    required this.pageController,
  });
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
              child: Column(
                children: [
                  ImageHeader(
                    pageController: pageController,
                    imageCount: hotelDetails.images.length ,
                    hotelDetails: hotelDetails,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       const  VipContainer(title: "VIP Accsess"),
                        const SizedBox(height: 5),
                        Text(
                          hotelDetails.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: List.generate(
                            4.toInt(),
                            (index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 18,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          hotelDetails.address,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '${hotelDetails.rate}/5 ' + getRatingText(5),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Description:',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          hotelDetails.description,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'About The Property',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Icon(Icons.hotel),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Number of rooms',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 34,
                            ),
                            Text(
                              '${hotelDetails.numberOfRoom}',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Icon(Icons.phone),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Phone Number',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 34,
                            ),
                            Text(
                              '+9630992113657848',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: const [
                            Icon(Icons.link),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Website',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 34,
                            ),
                            Text(
                              "hotel Link here",
                              //'${hotelDetails.link}',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
  }

}

String getRatingText(double rate) {
    if (rate >= 1 && rate < 3) {
      return 'Bad';
    } else if (rate >= 3 && rate < 5) {
      return 'Good';
    } else if (rate == 5) {
      return 'Very Good';
    } else {
      return ''; // Return an empty string if rate is not within the defined range
    }
  }
