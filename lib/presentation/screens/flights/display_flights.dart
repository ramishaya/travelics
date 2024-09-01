import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'display_flights_details.dart';

 
class Display_Flights_Page extends StatefulWidget {


  @override
  _Display_Flights_PageState createState() => _Display_Flights_PageState();
}

class _Display_Flights_PageState extends State<Display_Flights_Page> {
  late final String source;
  late final String destination;
  late final DateTime departureDate;


  List<Map<String, dynamic>> flights = [
    {
      'companyName': 'Airline 1',
      'source': 'City A',
      'destination': 'City B',
      'departureTime': '12:00',
      'arrivalTime': '16:00'
    },
    {
      'companyName': 'Airline 2',
      'source': 'City A',
      'destination': 'City B',
      'departureTime': '15:00',
      'arrivalTime': '19:00'
    },
    {
      'companyName': 'Airline 1',
      'source': 'City A',
      'destination': 'City B',
      'departureTime': '12:00',
      'arrivalTime': '16:00'
    },
    {
      'companyName': 'Airline 1',
      'source': 'City A',
      'destination': 'City B',
      'departureTime': '12:00',
      'arrivalTime': '16:00'
    },
    {
      'companyName': 'Airline 1',
      'source': 'City A',
      'destination': 'City B',
      'departureTime': '12:00',
      'arrivalTime': '16:00'
    },
    {
      'companyName': 'Airline 1',
      'source': 'City A',
      'destination': 'City B',
      'departureTime': '12:00',
      'arrivalTime': '16:00'
    },
    // Add more flight data here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(

                    image: DecorationImage(
                      image: AssetImage("assets/images/plane.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),



              Expanded(
                child: Container(),
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.21,
            bottom: MediaQuery.of(context).size.height * 0.05,
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.easeOutQuint,
              margin: EdgeInsets.symmetric(horizontal: 17),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueGrey.shade300, Colors.blueAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.all(Radius.circular(40.0)),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 15.0,
                    spreadRadius: 5.0,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: ListView.builder(
                  itemCount: flights.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 5.0),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        title: Text(
                          '${flights[index]['companyName']}',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 10),
                            Text(
                              '${flights[index]['source']} - ${flights[index]['destination']}',
                              style: TextStyle(fontSize: 20.0, color: Colors.white70),
                            ),
                            Text(
                              '${flights[index]['departureTime']} - ${flights[index]['arrivalTime']}',
                              style: TextStyle(fontSize: 18.0, color: Colors.white70),
                            ),
                          ],
                        ),
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.flight, size: 30.0, color: Colors.blueAccent),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                        onTap: () { {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Ditails_Flights_Page(
                                // source: sourceController.text,
                                // destination: destinationController.text,
                                // departureDate: selectedDate!,
                              ),
                            ),
                          );
                        }
                          // Implement navigation or other actions here
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.21 - 50,
            left: MediaQuery.of(context).size.width - 330,
            child: Container(
              alignment: Alignment.center,
              width: 400,
              height: 50,
              child: Text('Flights Available',
                  style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
//Ditails_Flights_Page