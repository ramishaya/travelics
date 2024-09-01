import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateSelectionLogic {
  DateTime selectedDepartureTime = DateTime.now();
  DateTime selectedReturnTime = DateTime.now().add(const Duration(days: 1));

   showDepartureDatePicker(BuildContext context)  async{
    await showDatePicker (
      context: context,
      initialDate: selectedDepartureTime,
      firstDate: DateTime.now(),
      lastDate: DateTime(2024),
    ).then((value) {
      selectedDepartureTime = value!;
    });
  }

  bool isReturnDateValid() {
    return selectedReturnTime.isAfter(selectedDepartureTime);
  }

  showReturnDatePicker(BuildContext context)  async {
    await showDatePicker(
      context: context,
      initialDate: selectedReturnTime,
      firstDate: DateTime.now(),
      lastDate: DateTime(2024),
    ).then((value) {
      if (value != null) {
        if (value.isAfter(selectedDepartureTime)) {
          selectedReturnTime = value;
        } else {
          selectedReturnTime = selectedDepartureTime.add(const Duration(days: 1));
           showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Invalid Return Date'),
              content: const Text(
                'The return date must be after the departure date. The return date has been set to a day before the departure date by default.',
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );

        }
      }
    });

  
    }
  
}
