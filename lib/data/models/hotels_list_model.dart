class HotelsListModel {
  String? name;
  String? imageProfile;
  String? address;
  int? stars;
  int? rate;
  

  HotelsListModel(
      {this.name,
      this.imageProfile,
      this.address,
      this.stars,
      this.rate,
     });

  HotelsListModel.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    imageProfile = json['image_profile'];
    address = json['address'];
    stars = json['stars'];
    rate = json['rate'];
   
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = name;
    data['image_profile'] = imageProfile;
    data['address'] = address;
    data['stars'] = stars;
    data['rate'] = rate;
    
    return data;
  }
}
