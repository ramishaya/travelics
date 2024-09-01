class RestDetailsModel {
  String? name;
  String? address;
  String? type;
  int? rate;
  String? description;
  String? imageProfile;
  int? phone;

  RestDetailsModel(
      {this.name,
      this.address,
      this.type,
      this.rate,
      this.description,
      this.imageProfile,
      this.phone});

  RestDetailsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    type = json['type'];
    rate = json['rate'];
    description = json['description'];
    imageProfile = json['image_profile'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address'] = this.address;
    data['type'] = this.type;
    data['rate'] = this.rate;
    data['description'] = this.description;
    data['image_profile'] = this.imageProfile;
    data['phone'] = this.phone;
    return data;
  }
}