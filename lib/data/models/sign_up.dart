// class SignUpModel{
//   String ? token_type;
//   String ? access_token;
//   UserData ? dataUser;
//   // String  ?prof_img_url;
//   SignUpModel.fromJson(Map<String,dynamic> json){
//     token_type=json['token_type']??null;
//     access_token=json['access_token']??null;
//     //  prof_img_url=json['prof_img_url']??null;
//     dataUser=json['user']!=null?UserData.fromJson(json['user']):null;
//   }
// }
// class UserData{
//   String ? fname;
//   String ? lname;
//   String ? nationality;
//   String ? email;
//   String ? password;
//   UserData.fromJson(Map<String,dynamic> json){
//     fname=json['fname'];
//     lname=json['lname'];
//     nationality=json['nationality'];
//     email=json['email'];
//     password=json['password'];
//
//
//   }
// }
/*
class SignupModel {
  String? token;
  int? state;
  User? user;

  //  UserData? dataUser;
  SignupModel({this.token, this.state, this.user});

  SignupModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    data['state'] = this.state;
    return data;
  }
*/

  // SignupModel.fromJson(Map<String, dynamic> json) {
  //   // token = json['token'];
  //   // state = json['state'];
  //   user = json['user'] != null ? new User.fromJson(json['user']) : null;
  //   data['token'] = this.token;
  //   data['state'] = this.state;
  //   return data;}


  // @override
  // String toString() {
  //   return 'SignupModel(token: $token, state: $state,userData: $userData)';
  // }
/*
}
class User {
  String? email;

  User({
    this.email,
  });

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    return data;
  }

// @override
// String toString() {
//   return 'User(email: $email)';
// }
}
*/
class SignupModel {
  String? token;
  int? state;
  User? user;

  SignupModel({this.token, this.state, this.user});

  SignupModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'token': token,
      'state': state,
    };
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }

  // @override
  // String toString() {
  //   return 'SignupModel(token: $token, state: $state, email: ${user?.email})';
  // }
}

class User {
  String? First_name;
  String? Last_name;
  String? nationality;
  String? email;

  User({
    this.First_name,
    this.Last_name,
    this.nationality,
    this.email,
  });

  User.fromJson(Map<String, dynamic> json) {
    First_name = json['First_name'];
    Last_name = json['Last_name'];
    nationality = json['nationality'];
    email = json['email'];
   // password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'email': email,
    };
    return data;
  }
  //
  // @override
  // String toString() {
  //   return 'User(email: $email)';
  // }
}

