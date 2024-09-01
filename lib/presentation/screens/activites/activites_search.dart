import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:substring_highlight/substring_highlight.dart';
import '../../../const/const.dart';

class ActivitesSearch extends StatefulWidget {
  const ActivitesSearch({super.key});

  @override
  State<ActivitesSearch> createState() => _ActivitesSearchState();
}

class _ActivitesSearchState extends State<ActivitesSearch> {
  late List<String> autoCompleteActivitesData;
  late TextEditingController activitesController = TextEditingController();
  Future fetchActivitesNamesData() async {
    final String jsonActivitesNames =
        await rootBundle.loadString("assets/city.json");
    final List<dynamic> listActivitesNames = jsonDecode(jsonActivitesNames);
    final List<String> activitesNames = listActivitesNames.cast<String>();

    setState(() {
      autoCompleteActivitesData = activitesNames;
    });
  }

  List<Widget> buildAppBarActions() {
    return [
      InkWell(
        onTap: () {
          String searchText = activitesController.text.toLowerCase();
          bool containsValue = autoCompleteActivitesData
              .any((activite) => activite.toLowerCase() == searchText);
          if (containsValue) {
            Navigator.pushNamed(context, activitesList,
                arguments: activitesController.text);
          }
        },
        child: Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
          width: 70,
          decoration: BoxDecoration(
            color: const Color(kPrimaryColor),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Center(child: Text("Search")),
        ),
      )
    ];
  }

  void clearSearch() {
    setState(() {
      activitesController.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchActivitesNamesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white, //const Color(kSecondaryColor),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.1),
          child: Container(color: const Color(borderColors), height: 0.1),
        ),
        leading: BackButton(
          color: const Color(kPrimaryColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: buildAppBarActions(),
        title: Autocomplete(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text.isEmpty) {
              return const Iterable<String>.empty();
            } else {
              return autoCompleteActivitesData.where((city) => city
                  .toLowerCase()
                  .startsWith(textEditingValue.text.toLowerCase()));
            }
          },
          onSelected: (selectedCity) {
            // ignore: avoid_print
            print(selectedCity);
          },
          optionsViewBuilder: (context, Function(String) onSelected, options) {
            return ListView.builder(
                itemBuilder: (context, index) {
                  final option = options.elementAt(index);
                  return Material(
                    color: Colors.white, //const Color(kSecondaryColor),
                    child: InkWell(
                      onTap: () {
                        onSelected(option.toString());
                        print("rami");
                        // ! here  we make the get requesrt
                      },
                      child: Column(
                        children: [
                          Row(children: [
                            Icon(Icons.local_activity_sharp),
                            SubstringHighlight(
                              text: option.toString(),
                              term: activitesController.text,
                              textStyleHighlight:
                                  const TextStyle(color: Color(kPrimaryColor)),
                            ),
                          ]),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: options.length);
          },
          fieldViewBuilder:
              (context, controller, focusNode, onEditingComplete) {
            activitesController = controller;
            return Row(
              children: [
                Expanded(
                  child: Container(
                    child: TextField(
                      controller: controller,
                      focusNode: focusNode,
                      onEditingComplete: onEditingComplete,
                      cursorColor: const Color(kPrimaryColor),
                      decoration: const InputDecoration(
                        hintText: "Enter Activity",
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    clearSearch();
                  },
                  icon: Icon(Icons.clear),
                  color: Color(kPrimaryColor),
                )
              ],
            );
          },
        ),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white, //const Color(kSecondaryColor),
    );
  }
}
