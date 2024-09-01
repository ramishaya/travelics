import 'dart:core';

import 'package:tourism/data/web_services/my_reserve_web_services.dart';

import '../models/hotels.dart';
import '../models/my_reserve.dart';

class MyReserveRepository {
  final MyResrveWebServices myResrveWebServices;

  MyReserveRepository({required this.myResrveWebServices});

  Future<List<dynamic>> fetchMyReserveList() async {
    try {
      final response = await myResrveWebServices.fetchMyResrveList();
      final hotelReserve = response.data["Hotel"];
      final List<dynamic> hotels = hotelReserve.
          map((json) => HotelRes.fromJson(json)).toList();
      print("we ARE in my reserve repository");
      print(hotels[0]
          .name); // Also, note that it should be `.name` (in lowercase) not `.Name`
      return hotels;
    } catch (e) {
      print(e.toString());
      print("error in my reserve repository");
      return [];
    }
  }
}
