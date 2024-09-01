import 'package:flutter/material.dart';

import '../../../const/const.dart';

class IdeasCard extends StatelessWidget {
  const IdeasCard(
      {super.key,
      required this.id,
      required this.size,
      required this.img,
      required this.title,
      required this.desc});

  final Size size;
  final String img;
  final String title;
  final String desc;
  final int id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (id == 1) {
          Navigator.pushNamed(context, restSearch);
        }
        if (id == 2) {
          Navigator.pushNamed(context, weather);
        }

        if (id == 3) {
          Navigator.pushNamed(context, offersSearch);
        }
      },
      child: Container(
          margin: const EdgeInsets.only(
            left: kDefaultPadding,
            right: kDefaultPadding,
            bottom: kDefaultPadding,
          ),
          width: size.width * 0.90,
          height: size.height * 0.35,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),

              //border: Border.all(color: Color(0xFF333333), width: 1),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  img,
                ),
              )),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(desc,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 15)),
                ]),
          )),
    );
  }
}
