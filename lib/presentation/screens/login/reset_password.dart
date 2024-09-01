import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism/const/const.dart';

import '../../../bussines_logic/bloc/bloc/resetpassword_bloc_bloc.dart';
import '../../../bussines_logic/bloc/bloc/resetpassword_bloc_event.dart';
import '../../../bussines_logic/bloc/bloc/resetpassword_bloc_state.dart';
import '../../widgets/slimanwidgets/auth_componets/buttons_auth.dart';
import '../../widgets/slimanwidgets/auth_componets/coustemtextBodyauth.dart';
import '../../widgets/slimanwidgets/auth_componets/coustemtextfieldauth.dart';
import '../../widgets/slimanwidgets/auth_componets/logo.dart';
import '../../widgets/slimanwidgets/auth_componets/texttilte_auth.dart';


class Reset_Password_Page extends StatefulWidget {
  const Reset_Password_Page({Key? key}) : super(key: key);

  @override
  State<Reset_Password_Page> createState() => _Reset_Password_Page_State();
}

class _Reset_Password_Page_State extends State<Reset_Password_Page> {
  final TextEditingController otpController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
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
    final Reset_Password_Bloc reset_password_Bloc = BlocProvider.of<Reset_Password_Bloc>(context);

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
            Navigator.pushReplacementNamed(context,checkemail);
          },
        ),
        title: Text("Reset Password"
        ,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      body: BlocConsumer<Reset_Password_Bloc, Reset_Password_State>(
        listener: (context, state) {
          if (state is User_Reset_Password_SuccessState) {
         //   _saveToken(state.reset_Password_Model.message ?? '');
            print(
                "Done save token = ${state.reset_Password_Model.message}"); // Save the token to shared preferences
            Navigator.pushReplacementNamed(context, login);
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
                  TextTilte_Auth(text: "Reset Password"),
                  TextBoudy_Auth(
                    text: "Please Enter the OTP, your Email and new password",
                  ),
                  const SizedBox(height: 30),
                  TextField_Auth(
                    mycontroller: otpController,
                    hintText:  "enter OTP",
                    iconData: Icons.vpn_key_outlined,
                    labelText: "OTP",
                    auto: AutovalidateMode.onUserInteraction,
                  ),
                  TextField_Auth(
                    mycontroller: emailController,
                    hintText:  "Enter your Email",
                    iconData: Icons.email_outlined,
                    labelText:  "Email",
                    auto: AutovalidateMode.onUserInteraction,
                  ),
                  TextField_Auth(
                    mycontroller: newPasswordController,
                    hintText: "Enter your new password",
                    iconData: Icons.lock_outline,
                    labelText:  "new password",
                    obscureText: true,
                    auto: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 20),
                  Button_Auth(
                    text: "reset password",
                    onPressed: () {
                      if (formstate.currentState!.validate()) {
                        reset_password_Bloc.add(User_Reset_Password_Event(
                          otp: otpController.text,
                          email: emailController.text,
                          password: newPasswordController.text,
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
