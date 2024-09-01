class RoomModel {
  int? id;
  String? type;
  String? image;
  String? description;
  int? price;
  int? numberOfPerson;

  RoomModel(
      {this.type,
      this.image,
      this.description,
      this.price,
      this.numberOfPerson,
      this.id});

  RoomModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    image = json['image'];
    description = json['description'];
    price = json['price'];
    numberOfPerson = json['number_of_person'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['image'] = this.image;
    data['description'] = this.description;
    data['price'] = this.price;
    data['number_of_person'] = this.numberOfPerson;
    data['id'] = this.id;
    
    return data;
  }
}
