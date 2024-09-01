import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tourism/const/const.dart';
import 'package:tourism/presentation/screens/hotels/hotels_search.dart';

class GeneralSearch extends StatefulWidget {
  const GeneralSearch({super.key});

  @override
  State<GeneralSearch> createState() => _GeneralSearchState();
}

class _GeneralSearchState extends State<GeneralSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
            color: Color(kPrimaryColor)),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, hotelSearch);
                },
                child: _buildSearchOption("Hotels", Icons.hotel)),
            _buildDivider(),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, restSearch);
                },
                child:
            _buildSearchOption("Restaurants", Icons.restaurant)),
            _buildDivider(),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, activitesSearch);
                },
                child:
            _buildSearchOption("Attractions", Icons.local_activity)),
            _buildDivider(),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, hotelSearch
                  );
                },
                child:
            _buildSearchOption("Flights", Icons.airplanemode_active)),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchOption(String title, IconData icon) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: Colors.black, // Icon color
            ),
            SizedBox(width: 10.0),
            Text(
              title,
              style: TextStyle(
                color: Colors.black, // Text color
                fontSize: 18.0, // Text font size
              ),
            ),
          ],
        ),
        SizedBox(height: 10.0),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 1.0,
      color: Colors.black, // Divider color
      margin: EdgeInsets.symmetric(vertical: 10.0),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: GeneralSearch(),
//   ));
// }