// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:tourism/data/web_services/hotels_list_web_services.dart';

import '../models/hotels_list_model.dart';

class HotelsListRepository {
  final HotelsListWebServices hotelsListWebServices;

  HotelsListRepository({required this.hotelsListWebServices});

  Future<List<HotelsListModel>> fetchHotelsList(String name) async {
    try {
      final response = await hotelsListWebServices.fetchHotelsList(name);
      final hotelsList = response
          .map((e) => HotelsListModel.fromJson(e as Map<String, dynamic>))
          .toList();
      print(hotelsList[0].name);
      return hotelsList;
    } catch (e) {
      print(e.toString());
      print("error in hotelsa repository");
      return [];
    }
  }

 
}
