import 'package:tourism/data/web_services/city_guide_web_services.dart';

import '../models/city_guide.dart';

class CityGuideRepository {
  final CityGuideWebServices cityGuideWebServices;

  CityGuideRepository({required this.cityGuideWebServices});

  Future<List<CityGuide>> gatAllCity() async {
    try {
      final citys = await cityGuideWebServices.getAllCity();
      print(citys.toList());
      return citys
          .map((e) => CityGuide.fromJson(e as Map<String, dynamic>))
          .toList();
          
    } catch (e) {
      print(e.toString());
      print("hello from repository");
      return []; // or return an error message widget
    }
  }
}
