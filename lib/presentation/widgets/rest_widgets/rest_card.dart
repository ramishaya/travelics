import 'package:flutter/material.dart';
import 'package:tourism/data/models/hotels_list_model.dart';

import '../../../const/const.dart';
import '../../../data/models/rest_list_model.dart';

class RestCard extends StatelessWidget {
  final RestListModel rest;
  final String location;
  const RestCard({super.key, required this.rest, required this.location});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(rest.name);
        print(location);
        Navigator.pushNamed(
          context,
          restDetails,
          arguments: rest.name,
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: const BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        elevation: 2,
        margin: const EdgeInsets.only(
          bottom: 14,
          left: kDefaultPadding,
          right: kDefaultPadding,
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20.0),
                    ),
                    //child:  Image.asset("assets/images/hotel1.jpg"),
                     child: rest.image!.isNotEmpty
                         ? FadeInImage.assetNetwork(
                             fit: BoxFit.cover,
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.25,
                            placeholder: "assets/images/loading1.gif",
                            image:rest.image!)
                        : Image.asset(
                            "assets/images/loading1.gif",
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.25,
                          )
                          
                          ),
                Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Colors.grey,
                      // isFavorite ? Icons.favorite :+ Icons.favorite_border,
                      // color: isFavorite ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      // toggleFavorite(hotel.id);
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    rest.name!,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(rest.type!,
                      style: TextStyle(fontSize: 15),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4.0,
                          horizontal: 8.0,
                        ),
                        decoration: const BoxDecoration(
                          color: Color(kPrimaryColor),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8.0),
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              '${rest.rate}/5',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 4.0),
                            const Text(
                              'User Reviews',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment
                        .start, // Align the text and icon to the start
                    children: [
                      const Icon(Icons.location_on,
                          size: 20, color: Colors.grey),
                      const SizedBox(
                          width:
                              3.0), // Add some spacing between the icon and text
                      Expanded(
                        child: Text(
                          rest.address!,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
