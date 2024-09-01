class MyProfileModel {
  String? firstName;
  String? lastName;
  String? nationality;
  String? gender;
  String? image;

  MyProfileModel({
    this.firstName,
    this.lastName,
    this.nationality,
    this.gender,
    this.image,
  });

  factory MyProfileModel.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return MyProfileModel(
        firstName: json['First_name'],
        lastName: json['Last_name'],
        nationality: json['nationality'],
        gender: json['gender'],
        image: json['image'],
      );
    } else {
      throw FormatException("Invalid JSON format");
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['First_name'] = firstName;
    data['Last_name'] = lastName;
    data['nationality'] = nationality;
    data['gender'] = gender;
    data['image'] = image;
    return data;
  }
}
