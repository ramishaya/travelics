// TODO Implement this library.
class Categorys {
  final String title;
  final String img;
  Categorys({required this.img, required this.title});
  static List<Categorys> Cat = [
    Categorys(
      title: "Hotels",
      img: "assets/images/hotel10.jpg",
    ),
    Categorys(
      title: "Flights",
      img: "assets/images/flight.jpg",
    ),
    Categorys(
      title: "Activites",
      img: "assets/images/acti2.jpg",
    ),
  ];
}
