class ActivitesDetailsModel {
  String? name;
  String? address;
  String? description;
  int? rate;
  String? image;
  List<dynamic>? images;

  ActivitesDetailsModel(
      {this.name,
      this.address,
      this.description,
      this.rate,
      this.image,
      this.images});

  ActivitesDetailsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    description = json['description'];
    rate = json['rate'];
    image = json['image'];
    images = json['images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address'] = this.address;
    data['description'] = this.description;
    data['rate'] = this.rate;
    data['image'] = this.image;
    data['images'] = this.images;
    return data;
  }
}