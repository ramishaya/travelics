class Activity {
  final String id;
  final String title;
  final String description;
  final String imgURL;
  final double price;
  final double rating;

  Activity(
      {required this.id,
      required this.title,
      required this.description,
      required this.imgURL,
      required this.price,
      required this.rating});
  static List<Activity> activites = [
    Activity(id: "1"
    , title: "Eiffel Tower"
    , description: "The Eiffel Tower is a wrought-iron lattice tower located in Paris, France. It is one of the most recognizable landmarks in the world and offers stunning views of the city from its observation decks."
    , imgURL: "assets/images/1.jpg"
    , price: 20
    , rating: 3
    ),
    Activity(id: "2"
    , title: "Louvre Museum"
    , description: "The Louvre Museum is the world's largest art museum and a historic monument in Paris, France. It is home to thousands of works of art, including the famous painting, Mona Lisa."
    , imgURL: "assets/images/2.jpg"
    , price: 25
    , rating: 4
    ),Activity(id: "3"
    , title: "Seine River Cruise"
    , description: "A Seine River Cruise is a popular activity in Paris, France. It allows you to enjoy a scenic boat ride along the Seine River, passing by iconic landmarks such as the Eiffel Tower, Notre-Dame Cathedral, and the Louvre Museum."
    , imgURL: "assets/images/3.jpg"
    , price: 40
    , rating: 5
    ),Activity(id: "4"
    , title: "Buckingham Palace"
    , description: "Buckingham Palace is the official residence of the British monarch in London, England. It is known for its grand architecture, the Changing of the Guard ceremony, and its role as the backdrop for royal events"
    , imgURL: "assets/images/4.jpg"
    , price: 40
    , rating: 2
    ),Activity(id: "5"
    , title: "British Museum"
    , description: "The British Museum is a world-renowned museum located in London, England. It houses a vast collection of art and artifacts from various civilizations, including the Rosetta Stone and the Elgin Marbles."
    , imgURL: "assets/images/5.jpg"
    , price: 60
    , rating: 9
    ),Activity(id: "6"
    , title: "Westminster Abbey"
    , description: "Westminster Abbey is a Gothic abbey church in London, England. It is a UNESCO World Heritage site and has been the location of numerous royal weddings and coronations."
    , imgURL: "assets/images/6.jpg"
    , price: 33
    , rating: 3.5
    ),Activity(id: "7"
    , title: "The Shard"
    , description: "The Shard is a skyscraper in London, England, renowned for its distinctive glass exterior. It offers panoramic views of the city from its observation deck and is home to offices, restaurants, and a hotel."
    , imgURL: "assets/images/7.jpg"
    , price: 60
    , rating: 7.7
    ),Activity(id: "8"
    , title: "Camden Market"
    , description: "Camden Market is a vibrant market located in Camden Town, London, England. It is known for its eclectic mix of stalls selling fashion, art, crafts, antiques, and street food."
    , imgURL: "assets/images/8.jpg"
    , price: 44
    , rating: 6.5
    ),Activity(id: "9"
    , title: "Tower of London"
    , description: "The Tower of London is a historic castle situated on the banks of the River Thames in central London, England. It has served various purposes throughout history, including as a royal palace, prison, and treasury."
    , imgURL: "assets/images/9.jpg"
    , price: 30
    , rating: 8
    )
  ];
}
