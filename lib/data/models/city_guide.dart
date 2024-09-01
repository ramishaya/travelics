class CityGuide {
  String? name;
  String? imageProfile;

  CityGuide({this.name, this.imageProfile});

  CityGuide.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    imageProfile = json['image_profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['image_profile'] = this.imageProfile;
    return data;
  }
}