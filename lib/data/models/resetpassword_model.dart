class Reset_Password_Model {
  String? message;

  Reset_Password_Model({this.message});

  Reset_Password_Model.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}
