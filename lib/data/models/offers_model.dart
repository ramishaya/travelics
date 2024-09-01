

class Offers {
  int? id;
  String? type;
  String? image;
  String? description;
  int? oldPrice;
  int? newPrice;
  int? numberOfPerson;

  Offers(
      {this.id,
      this.type,
      this.image,
      this.description,
      this.oldPrice,
      this.newPrice,
      this.numberOfPerson});

  Offers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    image = json['image'];
    description = json['description'];
    oldPrice = json['old_price'];
    newPrice = json['new_price'];
    numberOfPerson = json['number_of_person'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['image'] = this.image;
    data['description'] = this.description;
    data['old_price'] = this.oldPrice;
    data['new_price'] = this.newPrice;
    data['number_of_person'] = this.numberOfPerson;
    return data;
  }
}