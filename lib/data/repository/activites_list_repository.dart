// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:tourism/data/web_services/hotels_list_web_services.dart';

import '../models/activites_list_model.dart';
import '../models/hotels_list_model.dart';
import '../web_services/activites_list_web_services.dart';

class ActivitesListRepository {
  final ActivitesListWebServices activitesListWebServices;

  ActivitesListRepository({required this.activitesListWebServices});

  Future<List<ActivitesListModel>> fetchActivitesList(String name) async {
    try {
      final response = await activitesListWebServices.fetchActivitesList(name);
      final activitesList = response
          .map((e) => ActivitesListModel.fromJson(e as Map<String, dynamic>))
          .toList();
      //print(activitesList[1].name);
      return activitesList;
    } catch (e) {
      print(e.toString());
      print("error in repository");
      return [];
    }
  }

 
}
