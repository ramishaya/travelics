import 'package:flutter/material.dart';
import 'package:tourism/presentation/widgets/flights_search_widgets.dart/spereate_line_with_icon_widget.dart';

import '../../../const/const.dart';
import 'destination_search_widget.dart';

class TripDestinationWidget extends StatelessWidget {
  const TripDestinationWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
      padding: const EdgeInsets.all(10),
      width: size.width,
      height: size.height * 0.21,
      decoration: BoxDecoration(
          border: Border.all(color: const Color(borderColors2)),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "From",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          SizedBox(height: 10),
          DestinationSearchWidget(destination: "Tokyo"),
          SizedBox(height: 10),
          SperateLineWithIcon(type: Icons.flight),
          SizedBox(height: 10),
          Text(
            "To",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          SizedBox(height: 10),
          DestinationSearchWidget(destination: "Berlin"),
        ],
      ),
    );
  }
}
