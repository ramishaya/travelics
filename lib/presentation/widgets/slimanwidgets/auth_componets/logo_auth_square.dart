import 'package:flutter/cupertino.dart';

class Logo_Auth_Square extends StatelessWidget {
  const Logo_Auth_Square({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 300,
      width: 500,
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/ourlogo1.png"),
            fit: BoxFit.fill,
          )),
    );
  }
}
