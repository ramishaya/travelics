class CommentModel {
  String? userName;
  String? comment;
  int? rate;

  CommentModel({this.userName, this.comment, this.rate});

  CommentModel.fromJson(Map<String, dynamic> json) {
    userName = json['user_name'];
    comment = json['comment'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_name'] = this.userName;
    data['comment'] = this.comment;
    data['rate'] = this.rate;
    return data;
  }
}