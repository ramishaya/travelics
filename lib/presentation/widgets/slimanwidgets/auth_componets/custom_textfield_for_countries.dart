import 'package:flutter/material.dart';

class TextField_For_Countries extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final AutovalidateMode auto;
  final String? Function(String?) valid;
  final List<String> countries;
  final String? selectedCountry;

  const TextField_For_Countries({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.iconData,
    this.mycontroller,
    required this.auto,
    required this.valid,
    required this.countries,
    this.selectedCountry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: DropdownButtonFormField<String>(
        value: selectedCountry,
        onChanged: (value) {
          // Handle the dropdown selection
          // You can update the selectedCountry value here if needed
        },
        validator: valid,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          suffixIcon: Icon(iconData),
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        items: countries.map((country) {
          return DropdownMenuItem<String>(
            value: country,
            child: Text(country),
          );
        }).toList(),
      ),
    );
  }
}
/*TextField_For_Countries(
                  hintText: "Enter your Nationality",
                  labelText: "Nationality",
                  iconData: Icons.flag_outlined,
                  mycontroller: nationalityController,
                  auto: AutovalidateMode.onUserInteraction,
                  valid: (value) {
                    // Add your validation logic here
                    return null; // Return null if the input is valid, or an error message if it's not
                  },
                  countries: [
                    "Syria",
                    "Country 2",
                    "Country 3",
                    // Add more countries to the list
                  ],
                  selectedCountry: selectedCountry,
                )
                ,*/