


import 'package:flutter/material.dart';

import '../../../const/const.dart';

class HomeText extends StatelessWidget {
  const HomeText({
    required this.text,
    super.key,
  });
final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          left: kDefaultPadding,
          right: kDefaultPadding,
          bottom: kDefaultPadding),
      child: SizedBox(
        //height: size.height * 0.10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(text,
                style: const TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

