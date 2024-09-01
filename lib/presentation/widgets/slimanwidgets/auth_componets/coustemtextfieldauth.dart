import 'package:flutter/material.dart';



class TextField_Auth extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final bool obscureText;
  final AutovalidateMode auto;
 

  TextField_Auth({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.iconData,
    this.mycontroller,
    this.obscureText = false,
    required this.auto,
  }) : super(key: key);

  bool isPasswordCompliant(String password, [int minLength = 7]) {
    if (password.isEmpty) {
      return false;
    }

    bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
    bool hasDigits = password.contains(RegExp(r'[0-9]'));
    bool hasLowercase = password.contains(RegExp(r'[a-z]'));
    bool hasSpecialCharacters =
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool hasMinLength = password.length > minLength;

    return (hasDigits ||
            hasUppercase || 
            hasLowercase ||
            hasSpecialCharacters) &&
        hasMinLength;
  }

  String? validatePassword(String? value) {
    if (value != null && !isPasswordCompliant(value)) {
      return 'Password should be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one digit, and one special character.';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value != null &&
        !RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
            .hasMatch(value))
    {

      return 'Please enter a valid email address.';
    }
    return null;
  }

  String? validatefield(String? value) {
    if (value != null) {
      if (value.length < 3 || value.length > 40 || !RegExp(r'^[\w.@]+$').hasMatch(value)) {
        return 'Please enter a valid value.';
      }
    }
    return null;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        autovalidateMode: auto,
        controller: mycontroller,
        obscureText: obscureText,
        validator: labelText == 'Email'
            ? validateEmail
            : labelText == "Password"
                ? validatePassword
                : validatefield,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w100),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          suffixIcon: Icon(iconData),
          label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 9),
            child: Text(labelText),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}