class LogoutModel {
  String? massage;

  LogoutModel({this.massage});

  LogoutModel.fromJson(Map<String, dynamic> json) {
    massage = json['massage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['massage'] = this.massage;
    return data;
  }
}
