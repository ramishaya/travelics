import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'display_flights.dart';
 
 

class Select_Flights_Page extends StatefulWidget {
  @override
  _Select_Flights_PageState createState() => _Select_Flights_PageState();
}

class _Select_Flights_PageState extends State<Select_Flights_Page> {
  final sourceController = TextEditingController();
  final destinationController = TextEditingController();
  final dateController = TextEditingController();
  DateTime? selectedDate;
  final DateFormat formatter = DateFormat('dd-MM-yyyy');

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
            bottom: MediaQuery.of(context).size.height * 0.1,
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
                child: SingleChildScrollView( // This makes the column scrollable
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 40),
                      TextField(
                        controller: sourceController,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        decoration: InputDecoration(
                          labelText:   "Source",
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(color: Colors.white70),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(color: Colors.white70),
                          ),
                          prefixIcon:
                          Icon(Icons.flight_takeoff, color: Colors.white),
                          filled: true,
                          fillColor: Colors.white24,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: destinationController,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        decoration: InputDecoration(
                          labelText:  "Destination",
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(color: Colors.white70),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(color: Colors.white70),
                          ),
                          prefixIcon:
                          Icon(Icons.flight_land, color: Colors.white),
                          filled: true,
                          fillColor: Colors.white24,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: dateController,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "Departure time",
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(color: Colors.white70),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(color: Colors.white70),
                          ),
                          prefixIcon:
                          Icon(Icons.calendar_today, color: Colors.white),
                          filled: true,
                          fillColor: Colors.white24,
                        ),
                        onTap: () async {
                          FocusScope.of(context)
                              .requestFocus(new FocusNode()); // to address a flutter issue
                          selectedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(Duration(days: 365)),
                          );
                          dateController.text = selectedDate != null
                              ? formatter.format(selectedDate!)
                              : '';
                        },
                        readOnly: true,
                      ),
                      SizedBox(height: 50),
                      ElevatedButton(
                        onPressed: () {
                          {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Display_Flights_Page(
                                  // source: sourceController.text,
                                  // destination: destinationController.text,
                                  // departureDate: selectedDate!,
                                ),
                              ),
                            );
                          }
                        },
                        child: Text(
                         "Search Flights",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                          elevation: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.21 - 50,
            left: MediaQuery.of(context).size.width - 140,
            child: Container(
              alignment: Alignment.center,
              width: 120,
              height: 50,
              child: Text("Flights",
                  style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bussines_logic/bloc/bloc_search_flights/search_flight_state.dart';
import '../../../../bussines_logic/bloc/bloc_search_flights/search_flights.event.dart';
import '../../../../bussines_logic/bloc/bloc_search_flights/search_flights_bloc.dart';

import 'package:intl/intl.dart';
import 'package:untitled8/clasess/language_constants.dart';
import 'dispaly_flights_page/display_flights_page.dart';

class Select_Flights_Page extends StatefulWidget {
  @override
  _Select_Flights_PageState createState() => _Select_Flights_PageState();
}

class _Select_Flights_PageState extends State<Select_Flights_Page> {
  final sourceController = TextEditingController();
  final destinationController = TextEditingController();
  final dateController = TextEditingController();
  DateTime? selectedDate;
  final DateFormat formatter = DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SearchFlightsBloc, SearchFlightsState>(
        builder: (context, state) {
          if (state is SearchFlightsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SearchFlightsLoaded) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Display_Flights_Page(
                  flights: state.flights,
                ),
              ),
            );
          } else if (state is SearchFlightsError) {
            return Center(child: Text(state.message));
          }

          return Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/wing2.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.21,
                bottom: MediaQuery.of(context).size.height * 0.1,
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
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 40),
                          TextField(
                            controller: sourceController,
                            style: TextStyle(fontSize: 18, color: Colors.white),
                            decoration: InputDecoration(
                              labelText: translation(context).source,
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(color: Colors.white70),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(color: Colors.white70),
                              ),
                              prefixIcon: Icon(Icons.flight_takeoff, color: Colors.white),
                              filled: true,
                              fillColor: Colors.white24,
                            ),
                          ),
                          SizedBox(height: 20),
                          TextField(
                            controller: destinationController,
                            style: TextStyle(fontSize: 18, color: Colors.white),
                            decoration: InputDecoration(
                              labelText: translation(context).destination,
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(color: Colors.white70),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(color: Colors.white70),
                              ),
                              prefixIcon: Icon(Icons.flight_land, color: Colors.white),
                              filled: true,
                              fillColor: Colors.white24,
                            ),
                          ),
                          SizedBox(height: 20),
                          TextField(
                            controller: dateController,
                            style: TextStyle(fontSize: 18, color: Colors.white),
                            decoration: InputDecoration(
                              labelText: translation(context).departureDate,
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(color: Colors.white70),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(color: Colors.white70),
                              ),
                              prefixIcon: Icon(Icons.calendar_today, color: Colors.white),
                              filled: true,
                              fillColor: Colors.white24,
                            ),
                            onTap: () async {
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                              selectedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now().add(Duration(days: 365)),
                              );
                              dateController.text = selectedDate != null
                                  ? formatter.format(selectedDate!)
                                  : '';
                            },
                            readOnly: true,
                          ),
                          SizedBox(height: 50),
                          ElevatedButton(
                            onPressed: () {
                              context.read<SearchFlightsBloc>().add(
                                FetchFlightsEvent(
                                  source: sourceController.text,
                                  destination: destinationController.text,
                                  date: dateController.text,
                                ),
                              );
                            },
                            child: Text(
                              translation(context).searchFlights,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              padding:
                              EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                              elevation: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.21 - 50,
                left: MediaQuery.of(context).size.width - 140,
                child: Container(
                  alignment: Alignment.center,
                  width: 120,
                  height: 50,
                  child: Text(translation(context).flights,
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
*/