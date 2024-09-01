import 'package:flutter/material.dart';
import 'package:tourism/const/const.dart';
import 'package:tourism/presentation/widgets/home_page_widgets/custom_search_bar.dart';

class Header extends StatelessWidget {
  const Header(
      {super.key,
      required this.size,
      required this.circDg,
      required this.imgHeader});

  final Size size;
  final double circDg;
  final String imgHeader;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: kDefaultPadding),
      height: size.height * 0.25,
      //MediaQuery.of(context).size.height * 0.25,
      child: Stack(
        children: [
          Container(
            height: size.height * 0.25 - 15,
            //MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imgHeader),
                fit: BoxFit.cover,
              ),
              color: const Color(kPrimaryColor),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(circDg),
                bottomRight: Radius.circular(circDg),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    hotelSearch
                  );
                },
                child: CustomSearchBar()),
          ),
        ],
      ),
    );
  }
}
