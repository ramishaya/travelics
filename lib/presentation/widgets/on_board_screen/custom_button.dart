import 'package:flutter/material.dart';
import 'package:tourism/const/const.dart';

class CustomButton extends StatefulWidget {
  final Function() onPressed;
  final String text;
  final double width, height;
  const CustomButton(
      {required this.text,
      required this.onPressed,
      required this.width,
      required this.height,
      super.key});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      
      child: Center(
          child: Text(
        widget.text,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.white,
            ),
      )),
    );
  }
}
