class TripTypeModel {
  final int id;
  final String name;
  TripTypeModel({required this.id, required this.name});
}

final oneWay = TripTypeModel(id: 1, name: "One Way");
final roundTrip = TripTypeModel(id: 2, name: "Round Trip");
 
final tripType = [oneWay, roundTrip];
