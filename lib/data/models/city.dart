class City {
  final String name;
  final List<dynamic> image;
  final String description;
   String? countryname;
   String ?region;
   String ?officialLanguage;
   String? area;
   String? currency;
  

  City({required this.name, required this.image, required this.description, countryname,region,officialLanguage,area,currency});
  static List<City> cities = [
  City(
    name: 'New York',
    image: [
      'assets/images/newyourk.jpg',
      "assets/images/paris.jpg",
      "assets/images/tokyo2.jpg",
    ],
    description:
        'New York City is the largest city in the United States and...',
    countryname: "USA",  // Provide the value for countryname
    region: "North America",
    officialLanguage: "English",
    area: "185,180 square kilometers",
    currency: "US Dollars",
  ),
  City(
    name: 'Paris',
    image: [
      'assets/images/newyourk.jpg',
      "assets/images/paris.jpg",
      "assets/images/tokyo2.jpg",
    ],
    description:
        'Paris is the capital and most populous city of France...',
    countryname: "France",  // Provide the value for countryname
    region: "Europe",
    officialLanguage: "French",
    area: "105,000 square kilometers",
    currency: "Euro",
  ),
  City(
    name: 'Tokyo',
    image: [
      'assets/images/newyourk.jpg',
      "assets/images/paris.jpg",
      "assets/images/tokyo2.jpg",
    ],
    description:
        'Tokyo is the capital of Japan and one of the world\'s most populous cities...',
    countryname: "Japan",  // Provide the value for countryname
    region: "Asia",
    officialLanguage: "Japanese",
    area: "2,194 square kilometers",
    currency: "Japanese Yen",
  ),
];

}
