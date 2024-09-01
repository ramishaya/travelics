import 'package:flutter/material.dart';

class PicAuth extends StatelessWidget {
  const PicAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 200,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage("images/p1.png"),


          )),
    );
  }
}
