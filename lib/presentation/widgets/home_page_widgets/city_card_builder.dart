import 'package:flutter/material.dart';

import '../../../const/const.dart';
import '../../../data/models/city.dart';
import '../../../data/models/city_guide.dart';

class CityCardBuilder extends StatelessWidget {
  const CityCardBuilder({
    super.key,
    required this.size,
    required this.cityList,
  });

  final Size size;
  final List<CityGuide> cityList;

  @override
  Widget build(BuildContext context) {
    String explain = "Discover our most famous places";
    return Container(
      margin: const EdgeInsets.only(
        left: kDefaultPadding,
        right: kDefaultPadding,
        bottom: kDefaultPadding,
      ),
      height: size.height * 0.30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemCount: cityList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, cityDetails,
                  arguments: cityList[index].name);
            },
            child: Container(
              margin: const EdgeInsets.only(right: kDefaultPadding),
              width: size.width * 0.70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(kPrimaryColor),
                  border: Border.all(color: Color(0xFF333333), width: 1)),
              child:
                  //height: size.height * 0.15,
                  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Travel Guide",
                          style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          cityList[index].name!,
                          style: const TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${explain.split(' ').take(6).join(' ')},....",
                          style: const TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        child: cityList[index].imageProfile!.isNotEmpty
                            ? FadeInImage.assetNetwork(
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                                placeholder: 'assets/images/loading1.gif',
                                image: cityList[index].imageProfile!)
                            : Image.asset(
                                'assets/images/loading1.gif',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                              )),
                    // child: Container(
                    //   decoration: BoxDecoration(
                    //     borderRadius: const BorderRadius.only(
                    //         bottomLeft: Radius.circular(10),
                    //         bottomRight: Radius.circular(10)),
                    //     image: DecorationImage(
                    //         image: AssetImage(cityList[index].image[index]),
                    //         fit: BoxFit.cover),
                    //   ),
                    // ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
