import 'dart:convert';

import 'package:tourism/const/const.dart';

import '../models/hotels_details_model.dart';
import '../models/rest_details_model.dart';
import '../web_services/hotels_details_web_services.dart';
import '../web_services/rest_details_web_services.dart';

class RestDetailsRepository {
  final RestDetailsWebServices restDetailsWebServices;

  RestDetailsRepository(this.restDetailsWebServices);

  Future<RestDetailsModel> fetchRestDetails(String restName) async {
    try {
      final response = await restDetailsWebServices.fetchRestDetails(restName);
      print("hello from restuarant repositoiry");
      print(response[0]['address']);
      return RestDetailsModel(
        name: response[0]['name'],
        address: response[0]['address'],
        description: response[0]['description'],
        type: response[0]['type'],
        rate: response[0]['rate'],
        imageProfile: response[0]['image_profile'],
        phone: response[0]['phone'],
      );
    } catch (e) {
      print(e.toString());
      print("error in repository");
      return RestDetailsModel(
          name: "",
          address: "",
          description: "",
          imageProfile: "",
          type: "",
          rate: 0,
          phone: 0);
    }
  }
}
