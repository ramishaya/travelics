import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism/shared_preffrence.dart';

import '../../../bussines_logic/bloc/bloc/login_bloc_bloc.dart';
import '../../../bussines_logic/bloc/bloc/login_bloc_event.dart';
import '../../../bussines_logic/bloc/bloc/login_bloc_state.dart';
import '../../../const/const.dart';
import '../../../main.dart';
import '../../widgets/slimanwidgets/auth_componets/buttons_auth.dart';
import '../../widgets/slimanwidgets/auth_componets/coustemtextBodyauth.dart';
import '../../widgets/slimanwidgets/auth_componets/coustemtextfieldauth.dart';
import '../../widgets/slimanwidgets/auth_componets/logo.dart';
import '../../widgets/slimanwidgets/auth_componets/text_signup.dart';

import '../../widgets/slimanwidgets/auth_componets/texttilte_auth.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({Key? key}) : super(key: key);

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  // Future<void> _saveToken(String token) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('token', token);
  // }

  // Future<bool> _checkToken() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? token = prefs.getString('token');
  //   return token != null && token.isNotEmpty;
  // }

  void initShared() async {
    await SharedPref.init();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initShared();
  }

  @override
  Widget build(BuildContext context) {
    final LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);

    GlobalKey<FormState> formstate = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        toolbarHeight: 70,
        centerTitle: true,
        title: Text(
          'LogIn',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ),
        actions: <Widget>[
          // Padding(
          //   padding: const EdgeInsets.all(20),
          //   child: DropdownButton<Language>(
          //     underline: const SizedBox(),
          //     icon: const Icon(
          //       Icons.language,
          //       color: Colors.blue,
          //     ),
          //     onChanged: (Language? language) async {
          //       if (language != null) {
          //         Locale _locale = await setLocale(language.languageCode);
          //         MyApp.setLocale(context, _locale);
          //       }
          //     },
          //     items: Language.languageList()
          //         .map<DropdownMenuItem<Language>>(
          //           (e) => DropdownMenuItem<Language>(
          //             value: e,
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceAround,
          //               children: <Widget>[
          //                 Text(
          //                   e.flag,
          //                   style: const TextStyle(fontSize: 20),
          //                 ),
          //                 Text(e.name)
          //               ],
          //             ),
          //           ),
          //         )
          //         .toList(),
          //   ),
          // ),
        ],
      ),
      // drawer: Drawer(
      //   child: _drawerList(),
      // ),
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            SharedPref.saveData(
                key: 'firstName', value: state.loginModel.user?.firstName);

            SharedPref.saveData(
                key: 'lastName', value: state.loginModel.user?.lastName); //

            SharedPref.saveData(
                key: 'nationality',
                value: state.loginModel.user?.nationality); //

            SharedPref.saveData(
                key: 'email', value: state.loginModel.user?.email);

            SharedPref.saveData(key: 'token', value: state.loginModel.token);
            SharedPref.saveData(key: 'id', value: state.loginModel.user?.id);

            print("Done save token = ${state.loginModel.user?.id}");
            print(
                "Done save token = ${state.loginModel.token}"); //// Save the token to shared preferences
            Navigator.pushReplacementNamed(context, home);
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
                  TextTilte_Auth(text: "Welcome Back"),
                  TextBoudy_Auth(
                    text: "Login with your email and Password ",
                  ),
                  const SizedBox(height: 30),
                  TextField_Auth(
                  
                    mycontroller: emailController,
                    hintText: "Enter Your Email",
                    iconData: Icons.email_outlined,
                    labelText: "Email",
                    auto: AutovalidateMode.onUserInteraction,
                  ),
                  TextField_Auth(
                    mycontroller: passController,
                    hintText: "Enter Your Password",
                    iconData: Icons.lock_outline,
                    labelText: "Password",
                    auto: AutovalidateMode.onUserInteraction,
                    obscureText: true,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        //!  change routes 
                          context, checkemail);
                    },
                    child: Text(
                      "Forget Password",
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Button_Auth(
                    text: "Login",
                    onPressed: () {
                      if (formstate.currentState!.validate()) {
                        loginBloc.add(UserLoginEvent(
                          email: emailController.text,
                          password: passController.text,
                        ));
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  textSignUp(
                    textone: "If you dont have an account?  ",
                    texttwo:"    Sign Up",
                    onTap: () {
                      //! ndjbfjkbkfjdbjkdbkfjg
                      Navigator.pushReplacementNamed(context, signup);
                    },
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
