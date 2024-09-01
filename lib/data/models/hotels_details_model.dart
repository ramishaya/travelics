class HotelsDetailsModel {
  final String name;
  final String address;
  final String description;
  final String imageProfile;
  //final String link;
  //final int phone;
  //final double stars;
  final int numberOfRoom;
  final int rate;
  final List<dynamic> images;

  HotelsDetailsModel({
    required this.name,
    required this.address,
    required this.description,
    required this.imageProfile,
    // required this.link,
    // required this.phone,
    // required this.stars,
    required this.numberOfRoom,
    required this.rate,
    required this.images,
  });

  factory HotelsDetailsModel.fromJson(Map<String, dynamic> json) {
    return HotelsDetailsModel(
      name: json['Name'],
      address: json['Address'],
      description: json['description'],
      imageProfile: json['image_profile'],
      // link: json['link'],
      // phone: json['phone'],
      // stars: json['stars'],
      numberOfRoom: json['number_of_room'],
      rate: json['rate'],
      images : json['images']
    );
  }
  
}
