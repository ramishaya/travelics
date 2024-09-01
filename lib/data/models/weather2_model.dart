class Weather2Model{
  final int id;
  final String main;
  final String description;
  final String icon;

  Weather2Model(this.id, this.main, this.description, this.icon);
 String get getMain =>main;
  String get getDesc =>description;
  factory Weather2Model.fromJson(Map<String, dynamic> json) {
    return Weather2Model(
       json['id'],
       json['main'],
       json['description'],
      json['icon'],
    );
  }

}