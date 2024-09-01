import 'dart:convert';

import 'package:tourism/const/const.dart';

import '../models/hotels_details_model.dart';
import '../web_services/hotels_details_web_services.dart';

class HotelsDetailsRepository {
  final HotelsDetailsWebServices hotelsDetailsWebServices;

  HotelsDetailsRepository(this.hotelsDetailsWebServices);

  Future<HotelsDetailsModel> fetchHotelsDetails(String hotelName) async {
    try {
      final response =
          await hotelsDetailsWebServices.fetchHotelsDetails(hotelName);
      //print(response[1]['']);
      return HotelsDetailsModel(
        name: response[0]['name'],
        address: response[0]['address'],
        description: response[0]['description'],
        imageProfile: response[0]['image_profile'],
        numberOfRoom: response[0]['number_of_room'],
        rate: response[0]['rate'],
        images: response[0]['images'],
      );
    } catch (e) {
      print(e.toString());
      print("error in repository");
      return HotelsDetailsModel(
          name: "",
          address: "",
          description: "",
          imageProfile: "",
          numberOfRoom: 0,
          rate: 0,
          images: []);
    }
  }
}
