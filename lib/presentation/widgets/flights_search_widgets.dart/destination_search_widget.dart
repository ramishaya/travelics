 
import 'package:flutter/material.dart';

class DestinationSearchWidget extends StatelessWidget {
  const DestinationSearchWidget({
    required this.destination,
    super.key,
  });
  final String destination;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          destination,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.black,
          size: 15,
        )
      ]),
    );
  }
}