import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/const/const.dart';
import 'package:tourism/presentation/widgets/slimanwidgets/auth_componets/logo.dart';

import '../../../bussines_logic/bloc/checkemail_bloc.dart';
import '../../../bussines_logic/bloc/checkemail_event.dart';
import '../../../bussines_logic/bloc/checkemail_state.dart';
import '../../widgets/slimanwidgets/auth_componets/buttons_auth.dart';
import '../../widgets/slimanwidgets/auth_componets/coustemtextBodyauth.dart';
import '../../widgets/slimanwidgets/auth_componets/coustemtextfieldauth.dart';
import '../../widgets/slimanwidgets/auth_componets/texttilte_auth.dart';

class CheckingEmail_Page extends StatefulWidget {
  const CheckingEmail_Page({Key? key}) : super(key: key);

  @override
  State<CheckingEmail_Page> createState() => _CheckingEmail_PageState();
}

class _CheckingEmail_PageState extends State<CheckingEmail_Page> {
  final TextEditingController emailController = TextEditingController();

/*
  Future<void> _saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }*/
/*
  Future<bool> _checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    return token != null && token.isNotEmpty;
  }
*/
  @override
  void initState() {
    super.initState();
    /* _checkToken().then((loggedIn) {
      if (loggedIn) {
        Navigator.pushReplacementNamed(context, resetPassword_page);
      }
    })*/
  }

  @override
  Widget build(BuildContext context) {
    final CheckEmailBloc checkEmailBloc = BlocProvider.of<CheckEmailBloc>(context);

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
            Navigator.pushReplacementNamed(context, login);
          },
        ),
        title: Text(
     "Check Email",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      body: BlocConsumer<CheckEmailBloc, CheckEmailState>(
        listener: (context, state) {
          if (state is UserCheckEmailSuccessState) {
            //   _saveToken(state.checkEmailModel.message!);
            print("Done save token = ${state.checkEmailModel.message!}");
            print("Done save token = ${state.checkEmailModel.message}");
            Navigator.pushReplacementNamed(context, resetpass);
            //!
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
                  TextTilte_Auth(text:"Check Email"),
                   TextBoudy_Auth(
                    text: "Please Enter Your Email",
                  ),
                  const SizedBox(height: 30),
                  TextField_Auth(
                    mycontroller: emailController,
                    hintText: "Enter your Email",
                    iconData: Icons.email_outlined,
                    labelText: "email",
                    auto: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 20),
                  Button_Auth(
                    text:  "Check",
                    onPressed: () {
                      if (formstate.currentState!.validate()) {
                        checkEmailBloc.add(UserCheckEmailEvent(
                          email: emailController.text,
                        ));
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  /*    textSignUp(
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
