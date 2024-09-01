import '../models/activites_details_model.dart';

import '../web_services/activites_details_web_services.dart';

class ActivitesDetailsRepository {
  final ActivitesDetailsWebServices activitesDetailsWebServices;

  ActivitesDetailsRepository(this.activitesDetailsWebServices);

  Future<ActivitesDetailsModel> fetchActivitesDetails(
      String activitesName) async {
    try {
      final response = await activitesDetailsWebServices
          .fetchActivitesDetails(activitesName);
      print(response[0]['name']);
      return ActivitesDetailsModel(
        name: response[0]['name'],
        address: response[0]['address'],
        description: response[0]['description'],
        image: response[0]['image'],
        rate: response[0]['rate'],
        images: response[0]['images'],
      );
    } catch (e) {
      print(e.toString());
      print("error in repository");
      return ActivitesDetailsModel(
          name: "",
          address: "",
          description: "",
          image: "",
          rate: 0,
          images: []);
    }
  }
}
