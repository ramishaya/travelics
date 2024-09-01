class HotelRes {
  int? id;
  String? name;
  String? type;
  String? checkIn;
  String? checkOut;

  HotelRes({this.id, this.name, this.type, this.checkIn, this.checkOut});

  HotelRes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['Name'];
    type = json['type'];
    checkIn = json['check_in'];
    checkOut = json['check_out'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Name'] = this.name;
    data['type'] = this.type;
    data['check_in'] = this.checkIn;
    data['check_out'] = this.checkOut;
    return data;
  }
}