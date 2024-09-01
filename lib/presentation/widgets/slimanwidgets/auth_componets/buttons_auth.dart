import 'package:flutter/material.dart';

import '../../../../const/const.dart';



class Button_Auth extends StatelessWidget {
  final String text;
  final void Function() onPressed;


  const Button_Auth({super.key, required this.text, required this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return Container( margin: const EdgeInsets.only(top: 10),
      child: 
      MaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 13),
      onPressed: onPressed,
      color: const Color(kPrimaryColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      textColor: Colors.white,
      child: Text(text),
    ),);
  }
}
