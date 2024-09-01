import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tourism/bussines_logic/functions/date_selection_logic.dart';
import 'package:tourism/presentation/widgets/flights_search_widgets.dart/destination_search_widget.dart';
import 'package:tourism/presentation/widgets/global/my_taps.dart';
import '../../../const/const.dart';
import '../../widgets/flights_search_widgets.dart/trip_date_widget.dart';
import '../../widgets/flights_search_widgets.dart/trip_destination_widget.dart';

class FlightsSearch extends StatefulWidget {
  const FlightsSearch({super.key});

  @override
  State<FlightsSearch> createState() => _FlightsSearchState();
}

class _FlightsSearchState extends State<FlightsSearch> {
  DateSelectionLogic _dateSelectionLogic = DateSelectionLogic();
  // DateTime selectedDepatureTime = DateTime.now();
  // DateTime selectedReturnTime = DateTime.now().add(const Duration(days: 1));
  // void showDepatureDatePicker() {
  //   showDatePicker(
  //           context: context,
  //           initialDate: selectedDepatureTime,
  //           firstDate: DateTime.now(),
  //           lastDate: DateTime(2024))
  //       .then((selectedTime) {
  //     setState(() {
  //       selectedDepatureTime = selectedTime!;
  //     });
  //   });
  // }

  // bool isReturnDateValid() {
  //   return selectedReturnTime.isAfter(selectedDepatureTime);
  // }

  // void showReturnDatePicker() {
  //   showDatePicker(
  //     context: context,
  //     initialDate: selectedReturnTime,
  //     firstDate: DateTime.now(),
  //     lastDate: DateTime(2024),
  //   ).then((selectedTime) {
  //     if (selectedTime != null) {
  //       if (selectedTime.isAfter(selectedDepatureTime)) {
  //         setState(() {
  //           selectedReturnTime = selectedTime;
  //         });
  //       } else {
  //         setState(() {
  //           selectedReturnTime = selectedDepatureTime.add(const Duration(days: 1));
  //         });
  //         showDialog(
  //           context: context,
  //           builder: (BuildContext context) {
  //             return AlertDialog(
  //               title: const Text('Invalid Return Date'),
  //               content: const Text(
  //                   'The return date must be after the departure date. The return date has been set to a day before the departure date by default.'),
  //               actions: [
  //                 TextButton(
  //                   onPressed: () {
  //                     Navigator.of(context).pop();
  //                   },
  //                   child: const Text('OK'),
  //                 ),
  //               ],
  //             );
  //           },
  //         );
  //       }
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      height: size.height * 0.80,
      width: size.width,
      child: Stack(
        children: [
          Container(
            height: size.height * 0.27,
            width: size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/air1.jpg"),
                fit: BoxFit.cover,
              ),
              color: Color(kPrimaryColor),
            ),
          ),
          Positioned(
            bottom: size.height * 0.13,
            left: size.width * 0.10,
            right: size.width * 0.10,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 4,
              child: SizedBox(
                height: size.height * 0.70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyTaps(size: size),
                    TripDestinationWidget(size: size),
                    TripDateWidget(
                        size: size,
                        depatureTime: _dateSelectionLogic.selectedDepartureTime,
                        showDatePicker: _dateSelectionLogic.showDepartureDatePicker(context),
                        title: "Depature Date"),
                    TripDateWidget(
                        size: size,
                        depatureTime: _dateSelectionLogic.selectedReturnTime,
                        showDatePicker: _dateSelectionLogic.showReturnDatePicker(context),
                        title: "Return Date"),
                    // print here the selected time
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
