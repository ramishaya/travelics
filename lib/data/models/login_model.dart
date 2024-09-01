class LoginModel {
  String? token;
  User? user;

  LoginModel({this.token, this.user});

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? nationality;
  String? gender;
  String? image;
  String? email;
  String? emailVerifiedAt;
  int? wallet;
  String? createdAt;
  String? updatedAt;
  Null? mobile;

  User(
      {this.id,
        this.firstName,
        this.lastName,
        this.nationality,
        this.gender,
        this.image,
        this.email,
        this.emailVerifiedAt,
        this.wallet,
        this.createdAt,
        this.updatedAt,
        this.mobile});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['First_name'];
    lastName = json['Last_name'];
    nationality = json['nationality'];
    gender = json['gender'];
    image = json['image'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    wallet = json['wallet'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['First_name'] = this.firstName;
    data['Last_name'] = this.lastName;
    data['nationality'] = this.nationality;
    data['gender'] = this.gender;
    data['image'] = this.image;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['wallet'] = this.wallet;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['mobile'] = this.mobile;
    return data;
  }
}