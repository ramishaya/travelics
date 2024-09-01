import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../const/const.dart';

class TripDateWidget extends StatelessWidget {
  const TripDateWidget(
      {super.key,
      required this.size,
      required this.showDatePicker,
      required this.title,
      required this.depatureTime});

  final String title;
  final Size size;
  final DateTime depatureTime;
  final showDatePicker;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      padding: const EdgeInsets.all(10),
      width: size.width,
      height: size.height * 0.1,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(borderColors2)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: showDatePicker,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DateFormat.yMd().format(depatureTime),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black,
                    size: 15,
                  )
                ]),
          )
        ],
      ),
    );
  }
}
