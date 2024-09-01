class Email_Virffication_Model {
  String? message;

  Email_Virffication_Model({this.message});

  Email_Virffication_Model.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}
