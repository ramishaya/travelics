import 'package:flutter/material.dart';

class TextBoudy_Auth extends StatelessWidget {
  final String text;


  const TextBoudy_Auth({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
       text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}