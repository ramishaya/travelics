class UpdateProfileModel {
  int? state;

  UpdateProfileModel({this.state});

  UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    return data;
  }
}