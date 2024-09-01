

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourism/presentation/widgets/hotels_details_widgets/vip_container.dart';

import '../../../data/models/hotels_details_model.dart';
import '../../../data/models/rest_details_model.dart';


class RestDetailsWidget extends StatelessWidget{
  final RestDetailsModel restDetails;
  //final PageController pageController;

  const RestDetailsWidget({
    required this.restDetails,
    // required this.pageController,
  });
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      height:  200,
                      child : restDetails.imageProfile!.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.25,
                      placeholder: "assets/images/loading1.gif",
                      image: restDetails.imageProfile!)
                  : Image.asset(
                      "assets/images/loading1.gif",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.25,
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       const  VipContainer(title: "VIP Accsess"),
                        const SizedBox(height: 5),
                        Text(
                          restDetails.name!,
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
                          restDetails.address!,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '${restDetails.rate}/5 ' + getRatingText(5),
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
                          restDetails.description!,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'About The Restaurant',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            const Icon(Icons.restaurant),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'type',
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
                              '${restDetails.type}',
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
                              '${restDetails.phone}',
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
