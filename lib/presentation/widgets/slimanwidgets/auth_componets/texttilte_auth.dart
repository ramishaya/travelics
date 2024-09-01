import 'package:flutter/material.dart';

class TextTilte_Auth extends StatelessWidget {
  final String text;

  TextTilte_Auth({super.key, required this.text});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.black)
      ),
    );
  }
}
