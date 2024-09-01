import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism/const/const.dart';
import 'package:tourism/shared_preffrence.dart';

import '../../../bussines_logic/bloc/bloc/bloc/signup_bloc.dart';
import '../../../bussines_logic/bloc/bloc/bloc/signup_state.dart';
import '../../widgets/slimanwidgets/auth_componets/buttons_auth.dart';
import '../../widgets/slimanwidgets/auth_componets/coustemtextBodyauth.dart';
import '../../widgets/slimanwidgets/auth_componets/coustemtextfieldauth.dart';
import '../../widgets/slimanwidgets/auth_componets/logo.dart';
import '../../widgets/slimanwidgets/auth_componets/texttilte_auth.dart';
 

class Signup_Page extends StatefulWidget {
  const Signup_Page({Key? key}) : super(key: key);

  @override
  State<Signup_Page> createState() => _Signup_PageState();
}

class _Signup_PageState extends State<Signup_Page> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();
  final formKey = GlobalKey<FormState>();

//  CacheHelper? prefs;

  // Future<bool> _checkToken() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? token = prefs.getString('token');
  //   return token != null && token.isNotEmpty;
  // }
  void initShared() async {
    await SharedPref.init();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _checkToken().then((loggedIn) {
  //     if (loggedIn) {
  //       Navigator.pushReplacementNamed(context, home);
  //     }
  //   });
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initShared();
  }

  @override
  Widget build(BuildContext context) {
    final SignupBloc signupBloc = BlocProvider.of<SignupBloc>(context);
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
            Navigator.pushReplacementNamed(context, login);
          },
        ),
        title:  Text(
          "New Account",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      body: BlocConsumer<SignupBloc, SignupState>(
        listener: (context, state) {
          if (state is SignUpSuccessed) {
            print('66');
            print(state.signUpModel.token);
            print(state.signUpModel.state);

            SharedPref.saveData(key: 'token', value: state.signUpModel.token);
            //!lfmdlmgf
            Navigator.pushReplacementNamed(context, emailvri);

            //
            // SharedPref.saveData(
            //   key: 'token',
            //   value: state.signUpModel.token!,
            // ).then((value) {
            //   print("Done save token =${state.signUpModel.token!}");
            //   Navigator.pushReplacementNamed(context, emailVirffication_page);
            // });
            //
            // SharedPref.saveData(
            //   key: 'token',
            //   value: state.signUpModel.token!,
            // );
            // SharedPref.saveData(
            //   key: 'email_user',
            //   value: state.signUpModel.user.toString(),
            // );
          }
        },
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  Logo(),
                  const SizedBox(height: 10),
                  TextTilte_Auth(text: "New Account"),
                  TextBoudy_Auth(
                    text: "Sign Up with your information",
                  ),
                  const SizedBox(height: 30),
                  TextField_Auth(
                    mycontroller: firstnameController,
                    hintText:"Enter Your First Name",
                    iconData: Icons.person_outlined,
                    labelText:"First Name ",
                    auto: AutovalidateMode.onUserInteraction,
                  ),
                  TextField_Auth(
                    mycontroller: lastnameController,
                    hintText: "Enter Your Last Name",
                    iconData: Icons.person_outlined,
                    labelText: "Last Name",
                    auto: AutovalidateMode.onUserInteraction,
                  ),
                  TextField_Auth(
                    mycontroller: nationalityController,
                    hintText: "Enter Your Nationality",
                    iconData: Icons.flag_outlined,
                    labelText:"Nationality",
                    auto: AutovalidateMode.onUserInteraction,
                  ),
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
                    labelText:"Password",
                    auto: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 20),
                  Button_Auth(
                    text:  "Next",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState?.save();
                        signupBloc.userSignup(
                            First_name: firstnameController.text,
                            Last_name: lastnameController.text,
                            nationality: nationalityController.text,
                            email: emailController.text,
                            password: passController.text);
                      }
                      // if (formKey.currentState!.validate()) {
                      //   formKey.currentState!.save();
                      //   signupBloc.add(SignUpEvent(
                      //     First_name: firstnameController.text,
                      //     Last_name: lastnameController.text,
                      //     nationality: nationalityController.text,
                      //     email: emailController.text,
                      //     password: passController.text,
                      //   ));
                      // }
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

////////////*/**/////////////////
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:untitled8/const/const.dart';
// import '../../../bussines_logic/bloc/auth_bloc/bloc_signup/signup_bloc.dart';
// import '../../../bussines_logic/bloc/auth_bloc/bloc_signup/signup_event.dart';
// import '../../../bussines_logic/bloc/auth_bloc/bloc_signup/signup_state.dart';
// import '../../../components/coustemtextboudyauth.dart';
// import '../../../components/coustemtextfieldauth.dart';
// import '../../../components/coustemtexttilteauth.dart';
// import '../../../components/coustmebuttonsauth.dart';
// import '../../../components/logo.dart';
// import '../../../components/styles/colors.dart';
//
//
// class Signup_Page extends StatefulWidget {
//   const Signup_Page({Key? key}) : super(key: key);
//
//   @override
//   State<Signup_Page> createState() => _Signup_PageState();
// }
//
// class _Signup_PageState extends State<Signup_Page> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passController = TextEditingController();
//   final TextEditingController firstnameController = TextEditingController();
//   final TextEditingController lastnameController = TextEditingController();
//   final TextEditingController nationalityController = TextEditingController();
//
//   Future<void> _saveToken(String token) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('token', token);
//   }
//
//   Future<bool> _checkToken() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? token = prefs.getString('token');
//     return token != null && token.isNotEmpty;
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _checkToken().then((loggedIn) {
//       if (loggedIn) {
//         Navigator.pushReplacementNamed(context, emailVirffication_page);
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final SignupBloc signupBloc = BlocProvider.of<SignupBloc>(context);
//
//     GlobalKey<FormState> formstate = GlobalKey<FormState>();
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0.0,
//         toolbarHeight: 70,
//         centerTitle: true,
//         leading: IconButton(
//           color: kOurAppColor,
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pushReplacementNamed(context,login_Page);
//           },
//         ),
//         title: const Text(
//           ' Sign Up',
//           style: TextStyle(
//             color: Colors.grey,
//             fontSize: 20,
//             fontWeight: FontWeight.w300,
//           ),
//         ),
//       ),
//       body: BlocConsumer<SignupBloc, SignupState>(
//         listener: (context, state) {
//           if (state is SignupSuccessState) {
//             _saveToken(state.signupModel.toString() );
//             print("Done save token = ${state.signupModel}");
//             Navigator.pushReplacementNamed(context, emailVirffication_page);
//           }
//         },
//         builder: (context, state) {
//           return Container(
//             padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
//             child: Form(
//               key: formstate,
//               child: ListView(
//                 children: [
//                   Logo(),
//                   const SizedBox(height: 10),
//                   const TextTilte_Auth(text: "New Account"),
//                   const TextBoudy_Auth(
//                     text: 'Sign Up with your information ',
//                   ),
//                   const SizedBox(height: 30),
//                   TextField_Auth(
//                     mycontroller: firstnameController,
//                     hintText: "Enter your First Name",
//                     iconData: Icons.person_outlined,
//                     labelText: "First Name",
//                     auto: AutovalidateMode.onUserInteraction,
//                   ),
//                   TextField_Auth(
//                     mycontroller: lastnameController,
//                     hintText: "Enter your Last Name",
//                     iconData: Icons.person_outlined,
//                     labelText: "Last Name",
//                     auto: AutovalidateMode.onUserInteraction,
//                   ),
//                   TextField_Auth(
//                     mycontroller: nationalityController,
//                     hintText: "Enter your Nationality",
//                     iconData: Icons.flag_outlined,
//                     labelText: "Nationality",
//                     auto: AutovalidateMode.onUserInteraction,
//                   ),
//                   TextField_Auth(
//                     mycontroller: emailController,
//                     hintText: "Enter your Email",
//                     iconData: Icons.email_outlined,
//                     labelText: "Email",
//                     auto: AutovalidateMode.onUserInteraction,
//                   ),
//                   TextField_Auth(
//                     mycontroller: passController,
//                     hintText: "Enter your Password",
//                     iconData: Icons.lock_outline,
//                     labelText: "Password",
//                     auto: AutovalidateMode.onUserInteraction,
//                   ),
//                   const SizedBox(height: 20),
//                   Button_Auth(
//                     text: "Next",
//                     onPressed: () {
//                       if (formstate.currentState!.validate()) {
//                         signupBloc.add(UserSignupEvent(
//                           First_name: firstnameController.text,
//                           Last_name: lastnameController.text,
//                           nationality: nationalityController.text,
//                           email: emailController.text,
//                           password: passController.text,
//                         ));
//                       }
//                     },
//                   ),
//                   const SizedBox(height: 20),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
// if (formKey.currentState!.validate()) {
//   formKey.currentState!.save();
//   signupBloc.userSignup(
//       First_name: firstnameController!
//           .text,
//      Last_name: lastnameController!
//           .text,
//      nationality: nationalityController!
//           .text,
//       email:emailController!
//           .text,
//       password: passController!
//           .text);
// }// BlocConsumer<SignupBloc, SignupState>(
//         //   listener: (context, state) {
//         //     if (state is SignupSuccessState) {
//         //       _saveToken(state.signupModel.toString() );
//         //       print("Done save token = ${state.signupModel}");
//         //       Navigator.pushReplacementNamed(context, emailVirffication_page);
//         //     }
//         //   },
// Future<void> _saveToken(String token) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.setString('token', token);
// }
