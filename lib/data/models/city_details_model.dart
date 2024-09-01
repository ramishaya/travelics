class CityDetailsModel {
  String? name;
  String? imageProfile;
  String? description;

  CityDetailsModel({this.name, this.imageProfile, this.description});

  CityDetailsModel.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    imageProfile = json['image_profile'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['image_profile'] = this.imageProfile;
    data['description'] = this.description;
    return data;
  }
}