import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bussines_logic/cubits/cubit/cubit/reserve_cubit.dart';
import '../../../const/const.dart';

class ReserveHotel extends StatefulWidget {
  final int id;
  const ReserveHotel({super.key, required this.id});

  @override
  State<ReserveHotel> createState() => _ReserveHotelState();
}

class _ReserveHotelState extends State<ReserveHotel> {
  bool isValidEmail(String email) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegExp.hasMatch(email);
  }

  @override
  void initState() {
    print(widget.id);
    // TODO: implement initState
    super.initState();
  }

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _daysController = TextEditingController();
  bool _showError = false;

  void _checkInputValidity(String input) {
    setState(() {
      _showError = !isNumeric(input);
    });
  }

  bool isNumeric(String input) {
    if (input == null) {
      return false;
    }
    return double.tryParse(input) != null;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Secure Checkout",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(0.1),
          child: Divider(color: Color(borderColors), height: 0.1),
        ),
        leading: BackButton(
          color: const Color(kPrimaryColor),
          onPressed: () {
            BlocProvider.of<ReserveCubit>(context).reset();
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<ReserveCubit, ReserveState>(builder: (context, state) {
            if (state is ReserveInitial) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Who's checking in ? ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter an email';
                          } else if (!isValidEmail(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Color(kPrimaryColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Color(borderColors),
                              style: BorderStyle.solid,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Colors.blue,
                              style: BorderStyle.solid,
                            ),
                          ),
                          hintText: "Email",
                          hintStyle: TextStyle(color: Color(borderColors)),
                        ),
                        style: const TextStyle(color: Color(borderColors)),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        controller: passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a password';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.password,
                            color: Color(kPrimaryColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Color(borderColors),
                              style: BorderStyle.solid,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Colors.blue,
                              style: BorderStyle.solid,
                            ),
                          ),
                          hintText: "Password",
                          hintStyle: TextStyle(color: Color(borderColors)),
                        ),
                        style: const TextStyle(color: Color(borderColors)),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        controller: _daysController,
                        keyboardType: TextInputType.number,
                        onChanged: _checkInputValidity,
                        decoration: InputDecoration(
                          errorText:
                              _showError ? 'Please enter a valid number' : null,
                          prefixIcon: Icon(
                            Icons.timer,
                            color: Color(kPrimaryColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Color(borderColors),
                              style: BorderStyle.solid,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Colors.blue,
                              style: BorderStyle.solid,
                            ),
                          ),
                          hintText: "Duration",
                          hintStyle: TextStyle(color: Color(borderColors)),
                        ),
                        style: const TextStyle(color: Color(borderColors)),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            //primary: Color(kPrimaryColor),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20), // Adjust the radius as needed
                            ),
                            // Change the color here
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // All fields are valid, proceed with reservation
                              String email = emailController.text;
                              String password = passwordController.text;
                              int numberOfDays =
                                  int.parse(_daysController.text);

                              // Now you can use the email, password, and numberOfDays values
                              // to make the reservation
                              print('Email: $email');
                              print('Password: $password');
                              print('Number of days: $numberOfDays');

                              // Make the reservation logic here
                            }
                            BlocProvider.of<ReserveCubit>(context).makeReserve(
                                emailController.text,
                               int.parse(passwordController.text)   ,
                                widget.id,
                                int.parse(_daysController.text)  );
                          },
                          child: Text(
                            "Book",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is ReserveLoaded) {
              return Column(children: [
                Center(
                  child: Column(
                    children: [
                      Container(

                      ),
                      Text(
                        state.reserve.message.toString()
                      ),
                    ],
                  ),
                )
              ],);
            } else if(state is ReserveLoading){
              
    return Center(
      child: Image.asset('assets/images/loading1.gif'),
    );
 
            }
            else{
              
    return Center(
      child: Image.asset('assets/images/loading1.gif'),
    );
 
            }
          })
        ],
      )),
    );
  }
}
