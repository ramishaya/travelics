import 'package:flutter/material.dart';
import 'package:tourism/const/const.dart';




class textSignUp extends StatelessWidget {
  final String textone;
  final String texttwo;
  final void Function() onTap;

  const textSignUp(
      {super.key,
      required this.textone,
      required this.texttwo,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textone,
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            texttwo,
            style:const  TextStyle(color:  Color(kPrimaryColor), fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
