class RestListModel {
  String? name;
  String? address;
  String? type;
  int? rate;
  String? image;

  RestListModel({this.name, this.address, this.type, this.rate, this.image});

  RestListModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    type = json['type'];
    rate = json['rate'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address'] = this.address;
    data['type'] = this.type;
    data['rate'] = this.rate;
    data['image'] = this.image;
    return data;
  }
}
