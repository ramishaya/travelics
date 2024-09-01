import 'package:flutter/material.dart';
 
import '../../const/const.dart';

class SavingContainer extends StatelessWidget {
  const SavingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(kDefaultPadding),
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding,
      ),
      decoration: BoxDecoration(
        color: const Color(kPrimaryColor),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Container(
            width: 50.0,
            height: 50.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: const Icon(
              Icons.assignment_outlined,
              color: Color(kPrimaryColor),
              size: 30.0,
            ),
          ),
          const SizedBox(width: kDefaultPadding / 2),
          const Expanded(
            child: Text(
              "You're saving 10% or more with Member Prices because you're blue. Let's go!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
