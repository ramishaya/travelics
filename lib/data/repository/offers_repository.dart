import 'package:tourism/data/web_services/offers_web_services.dart';

import '../models/offers_model.dart';
import '../models/room_model.dart';
import '../web_services/room_web_services.dart';

class OffersRepository {
  final OffersWebServices offersWebServices;

  OffersRepository({required this.offersWebServices});

  Future<List<dynamic>> fetchOffers(String name) async {
    try {
      final response = await offersWebServices.fetchOffers(name);
      final offersList = response
          .map((e) => Offers.fromJson(e as Map<String, dynamic>))
          .toList();
      print("we are in offers repository");
      print(offersList[0].type);
      return offersList;
    } catch (e) {
      print(e.toString());
      print("error in repository");
      return [];
    }
  }
}
