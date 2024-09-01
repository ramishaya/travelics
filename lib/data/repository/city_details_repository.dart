import '../models/city_details_model.dart';

import '../web_services/city_details_web_services.dart';

class CityDetailsRepository {
  final CityDetailsWebServices cityDetailsWebServices;

  CityDetailsRepository(this.cityDetailsWebServices);

  Future<CityDetailsModel> fetchCityDetails(String cityName) async {
    try {
      final response = await cityDetailsWebServices.fetchCityDetails(cityName);
      return CityDetailsModel(
        name: response['name'],
        description: response['description'],
        imageProfile: response['image_profile'],
      );
    } catch (e) {
      return CityDetailsModel(
        name: "",
        description: "",
        imageProfile: "",
      );
    }
  }
}
