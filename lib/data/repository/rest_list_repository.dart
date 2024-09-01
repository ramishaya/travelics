// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:tourism/data/web_services/hotels_list_web_services.dart';

import '../models/hotels_list_model.dart';
import '../models/rest_list_model.dart';
import '../web_services/rest_list_web_services.dart';

class RestListRepository {
  final RestListWebServices restListWebServices;

  RestListRepository({required this.restListWebServices});

  Future<List<RestListModel>> fetchRestList(String name) async {
    try {
      final response = await restListWebServices.fetchRestList(name);
      final restList = response
          .map((e) => RestListModel.fromJson(e as Map<String, dynamic>))
          .toList();
      print(restList[0].name);
      return restList;
    } catch (e) {
      print(e.toString());
      print("error in repository");
      return [];
    }
  }

 
}
