import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../const/const.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
    Navigator.pushReplacementNamed(context, home);
    return false;
  },
      child: Container(
        child: Center(child: Text("Profile page")),
      ),
    );
  }
}
