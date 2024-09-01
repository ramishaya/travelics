class ActivitesListModel {
  String? name;
  String? imageProfile;
  String? address;
  String? description;
  int? rate;

  ActivitesListModel(
      {this.name,
      this.imageProfile,
      this.address,
      this.description,
      this.rate});

  ActivitesListModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageProfile = json['image_profile'];
    address = json['address'];
    description = json['description'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image_profile'] = this.imageProfile;
    data['address'] = this.address;
    data['description'] = this.description;
    data['rate'] = this.rate;
    return data;
  }
}