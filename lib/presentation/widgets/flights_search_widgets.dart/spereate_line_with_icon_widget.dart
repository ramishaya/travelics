
import 'package:flutter/cupertino.dart';

import '../../../const/const.dart';

class SperateLineWithIcon extends StatelessWidget {
  const  SperateLineWithIcon({
    required this.type,
    super.key,
  });
  final IconData type;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            height: 1, // Height of the line
            color: const Color(borderColors2), // Color of the line
          ),
        ),
        const SizedBox(width: 10), // Add space between the line and icon
         Icon(
          type,
          color: const Color(kPrimaryColor),
          size: 20, // Adjust the size of the flight icon as needed
        ),
      ],
    );
  }
}