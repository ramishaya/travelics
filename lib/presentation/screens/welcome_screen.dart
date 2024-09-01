import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tourism/const/const.dart';

import 'package:tourism/presentation/widgets/on_board_screen/app_large_text.dart';
import 'package:tourism/presentation/widgets/on_board_screen/app_text.dart';
import 'package:tourism/presentation/widgets/on_board_screen/responsive_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void didChangeDependencies() {
    precacheImage(const AssetImage("assets/images/greece.jpg"), context);
    precacheImage(const AssetImage("assets/images/plane.jpg"), context);
    precacheImage(const AssetImage("assets/images/hotell.jpg"), context);
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  PageController pc = PageController(initialPage: 0);
  var curPage = 0;
  List images = [
    "assets/images/greece.jpg",
    "assets/images/plane.jpg",
    "assets/images/hotell.jpg",
  ];
  List largeText = [
    "Beaches",
    "Culutre",
    "friends",
  ];
  List mediumText = [
    "Chill",
    "Discover",
    "Enjoy",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          physics: const BouncingScrollPhysics(),
          controller: pc,
          onPageChanged: (value) {
            // ignore: avoid_print
            print(value);
            setState(() {
              curPage = value;
            });
          },
          scrollDirection: Axis.vertical,
          itemCount: 3,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(images[index]))),
              child: Container(
                  margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppLargeText(
                            text: largeText[index],
                          ),
                          AppText(
                            text: mediumText[index],
                            size: 30,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 250,
                            child: AppText(
                                size: 14,
                                text:
                                    "Live un forgetable moments with the best vications and the best things in the world "),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          InkWell(
                              child: ResponsiveButton(),
                              onTap: () {
                                print("hello");
                                if (curPage > 1) {
                                  Navigator.pushReplacementNamed(
                                      context, login);
                                }
                                pc.animateToPage(
                                  curPage + 1,
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.easeIn,
                                );
                              }),
                        ],
                      ),
                      Column(
                          children: List.generate(3, (indexDots) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          width: 8,
                          height: index == indexDots ? 25 : 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index == indexDots
                                ? Colors.black
                                : Colors.black54,
                          ),
                        );
                      }))
                    ],
                  )),
            );
          }),
    );
  }
}
