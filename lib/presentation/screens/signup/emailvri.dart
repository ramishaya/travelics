import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism/const/const.dart';

import '../../../bussines_logic/bloc/emailvri_bloc.dart';
import '../../../bussines_logic/bloc/emailvri_event.dart';
import '../../../bussines_logic/bloc/emailvri_state.dart';
import '../../widgets/slimanwidgets/auth_componets/buttons_auth.dart';
import '../../widgets/slimanwidgets/auth_componets/coustemtextBodyauth.dart';
import '../../widgets/slimanwidgets/auth_componets/coustemtextfieldauth.dart';
import '../../widgets/slimanwidgets/auth_componets/logo.dart';
import '../../widgets/slimanwidgets/auth_componets/texttilte_auth.dart';
 

class Email_Virffcation_Page extends StatefulWidget {
  const Email_Virffcation_Page({Key? key}) : super(key: key);

  @override
  State<Email_Virffcation_Page> createState() => _Email_Virffcation_Page_State();
}

class _Email_Virffcation_Page_State extends State<Email_Virffcation_Page> {
  final TextEditingController otpController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

/*
  Future<void> _saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }
*//*
  Future<bool> _checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    return token != null && token.isNotEmpty;
  }
*/
  @override
  void initState() {
    super.initState();
    /*   _checkToken().then((loggedIn) {
      if (loggedIn) {
        Navigator.pushReplacementNamed(context, home);
      }
    });*/
  }

  @override
  Widget build(BuildContext context) {
    final Email_Virffication_Bloc email_Virffication_Bloc = BlocProvider.of<Email_Virffication_Bloc>(context);

    GlobalKey<FormState> formstate = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        toolbarHeight: 70,
        centerTitle: true,
        leading: IconButton(
          color: Color(kPrimaryColor),
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context,signup);
          },
        ),
        title:  Text(
       "Email Viriffication",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      body: BlocConsumer<Email_Virffication_Bloc,Email_Virffication_State>(
        listener: (context, state) {
          if (state is User_Email_Virffication_SuccessState) {
            //   _saveToken(state.reset_Password_Model.message ?? '');
            print(
                "Done save token = ${state.email_virffication_Model.message}"); // Save the token to shared preferences
            Navigator.pushReplacementNamed(context,login);
          }
        },
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Form(
              key: formstate,
              child: ListView(
                children: [
                  Logo(),
                  const SizedBox(height: 10),
                   TextTilte_Auth(text:  "email vrification"),
                   TextBoudy_Auth(
                    text: "Please enter your otp and email",
                  ),
                  const SizedBox(height: 30),
                  TextField_Auth(
                    mycontroller: otpController,
                    hintText: "enater OTP",
                    iconData: Icons.vpn_key_outlined,
                    labelText:  "OTP",
                    auto: AutovalidateMode.onUserInteraction,
                  ),
                  TextField_Auth(
                    mycontroller: emailController,
                    hintText:  "Enter Your Email",
                    iconData: Icons.email_outlined,
                    labelText:  "Email",
                    auto: AutovalidateMode.onUserInteraction,
                  ),

                  const SizedBox(height: 20),
                  Button_Auth(
                    text:  "Email  Viriffecation",
                    onPressed: () {
                      if (formstate.currentState!.validate()) {
                        email_Virffication_Bloc.add(User_Email_Virffication_Event(
                          otp: otpController.text,
                          email: emailController.text,
                        ));
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  /*   textSignUp(
                    textone: "if you don't have an account?",
                    texttwo: "   Sign Up",
                    onTap: () {
                      Navigator.pushReplacementNamed(context, signup_Page);
                    },
                  ),*/
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
