class Hotel {
  final String id;
  final String name;
  final String description;
  final String imgURL;
  final double rating;
  final String location;
  final double user_rate;

  Hotel({
    required this.id,
    required this.name,
    required this.description,
    required this.imgURL,
    required this.rating,
    required this.location,
    required this.user_rate
  });

  static List<Hotel> hotels = [
    Hotel(
        id: "1",
        name: "The Ritz London",
        description:
            "The Ritz London is a luxury hotel located in Piccadilly, London. It offers elegant rooms, exquisite dining options, and exceptional service. The hotel is known for its stunning architecture and timeless elegance.",
        imgURL: "assets/images/hotel1.jpg",
        rating: 4.8,
        location: "London",
        user_rate:3.5,
        ),
    Hotel(
        id: "2",
        name: "The Savoy",
        description:
            "The Savoy is a historic hotel situated on the Strand in the heart of London. It has been a symbol of glamour and luxury since its opening in 1889. The hotel features elegant rooms, world-class dining, and iconic views of the River Thames.",
        imgURL: "assets/images/hotel2.jpg",
        rating: 2,
        location: "London",
        user_rate:8.5,),
    Hotel(
        id: "3",
        name: "Claridge's",
        description:
            "Claridge's is a legendary luxury hotel located in Mayfair, London. It has been a favorite among royalty, celebrities, and discerning travelers since the 19th century. The hotel offers opulent rooms, Michelin-starred dining, and impeccable service.",
        imgURL: "assets/images/hotel3.jpg",
        rating: 4.7,
        location: "London",
        user_rate:3.5,),
    Hotel(
        id: "4",
        name: "The Dorchester",
        description:
            "The Dorchester is a prestigious hotel located in the exclusive area of Mayfair. It boasts elegant rooms, award-winning restaurants, and a luxurious spa. The hotel has a rich history and has welcomed numerous famous guests over the years.",
        imgURL: "assets/images/hotel4.jpg",
        rating: 4.5,
        location: "London",
        user_rate:3.5,),
    Hotel(
        id: "5",
        name: "Shangri-La Hotel, At The Shard, London",
        description:
            "The Shangri-La Hotel is situated within the iconic Shard skyscraper and offers breathtaking views of London's skyline. The hotel features luxurious rooms, a renowned restaurant, and a rooftop bar with panoramic views.",
        imgURL: "assets/images/hotel5.jpg",
        rating: 4.9,
        location: "London",
        user_rate:6.5,),
    Hotel(
        id: "6",
        name: "The Langham, London",
        description:
            "The Langham is a historic luxury hotel located in Marylebone, London. It is known for its Victorian charm, opulent rooms, and award-winning dining options. The hotel offers a refined and luxurious experience for guests.",
        imgURL: "assets/images/hotel6.jpg",
        rating: 4.4,
        location: "London",
        user_rate:5.5,),
    Hotel(
        id: "7",
        name: "Rosewood London",
        description:
            "Rosewood London is a stylish and elegant hotel situated in Holborn, London. It combines British heritage with contemporary luxury, offering spacious rooms, fine dining, and a serene spa. The hotel is renowned for its impeccable service and attention to detail.",
        imgURL: "assets/images/hotel7.jpg",
        rating: 4.7,
        location: "London",
        user_rate:4.5,),
    Hotel(
        id: "8",
        name: "The Berkeley",
        description:
            "The Berkeley is a luxurious 5-star hotel located in Knightsbridge, London. It offers sumptuous rooms, Michelin-starred dining, and a rooftop pool with panoramic views of the city. The hotel exudes elegance and sophistication.",
        imgURL: "assets/images/hotel8.jpg",
        rating: 4.6,
        location: "London",
        user_rate:2.5,),
    // Add more hotels here
  ];
}
