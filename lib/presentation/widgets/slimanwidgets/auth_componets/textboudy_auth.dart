import 'package:flutter/material.dart';

class CoustemTextBoudyAuth extends StatelessWidget {
  final String text;


  const CoustemTextBoudyAuth({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
       text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
