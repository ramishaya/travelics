import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponsiveButton({super.key, this.width=60, this.isResponsive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 6,bottom: 6),
        width: width,
        height: 60,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white,),
        //! dont forget to create a color class for the app 
       
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Image.asset("assets/images/next.png")
            
            ],
        ));
  }
}
