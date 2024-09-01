import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/const/const.dart';

import '../../../bussines_logic/bloc/bloc/my_profile_bloc_bloc.dart';
import '../../../bussines_logic/bloc/bloc/my_profile_bloc_state.dart';
import '../../../shared_preffrence.dart';


class My_Profile_Page extends StatefulWidget {
  @override
  _My_Profile_PageState createState() => _My_Profile_PageState();
}

class _My_Profile_PageState extends State<My_Profile_Page> {

  late MyProfileBloc myProfileBloc;
  late StreamSubscription<MyProfileState> subscription;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  void initShared() async {
  await SharedPref.init();
  }

  @override
  void initState() {
  super.initState();
  initShared();
  myProfileBloc = BlocProvider.of<MyProfileBloc>(context);

  // Subscribe to the profile bloc state changes
  subscription = myProfileBloc.stream.listen((state) async {
  if (state is MyProfileSuccess) {
  // Update the shared preferences data
  SharedPref.saveData(key: 'firstName', value: state.myProfileModel.firstName);
  SharedPref.saveData(key: 'lastName', value: state.myProfileModel.lastName);
  SharedPref.saveData(key: 'nationality', value: state.myProfileModel.nationality);
  SharedPref.saveData(key: 'gender', value: state.myProfileModel.gender);
 // await SharedPref.init(); // Initialize SharedPreferences if not already initialized
  //await SharedPref.saveData(key: 'image', value: state.myProfileModel.image);


  await SharedPref.init();
  String? savedImageUrl = SharedPref.getData(key: 'image');

  setState(() {});
  }
  });
  }

  @override
  void dispose() {
  // Clean up the stream subscription
  subscription.cancel();
  super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
        "Profile",
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(kPrimaryColor),
        elevation: 0,
        leading: IconButton(
          color: Color(kPrimaryColor),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, account);
          },
        ),
      ),
      body: BlocConsumer<MyProfileBloc, MyProfileState>(
        listener: (context, state) {
          if (state is MyProfileSuccess) {
            SharedPref.saveData(
                key: 'firstName', value: state.myProfileModel.firstName);
            SharedPref.saveData(
                key: 'lastName', value: state.myProfileModel.lastName);
            SharedPref.saveData(
                key: 'nationality', value: state.myProfileModel.nationality);
            SharedPref.saveData(key: 'gender', value: state.myProfileModel.gender);

          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                ProfileHeader(),
                SizedBox(height: 10),
                BlocProvider.value(
                  value: myProfileBloc,
                  child: ProfileOptions(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
class ProfileHeader extends StatefulWidget {
  @override
  _ProfileHeaderState createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  @override
  Widget build(BuildContext context) {
    final myProfileState = context.read<MyProfileBloc>().state;
    String? imageUrl;
    String? imageUrl1;
    if (myProfileState is MyProfileSuccess) {
      imageUrl = myProfileState.myProfileModel.image;
      imageUrl1 = myProfileState.myProfileModel.image;
      print("Image URL: $imageUrl");
    }

    return Container(
      child: Stack(
        children: [
          Container(
            height: 200.0,
            decoration: BoxDecoration(
              color: Color(kPrimaryColor),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 16.0,
            child: GestureDetector(
              onTap: () {
                // Handle image tap or editing logic here
              },
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 64.0,
                    backgroundColor: Colors.white,
                    backgroundImage: imageUrl != null
                        ? NetworkImage(('${imageBaseUrl}${imageUrl}'),)
                        : AssetImage('assets/images/logo.jpg') as ImageProvider<Object>,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}






class ProfileOptions extends StatefulWidget {
  @override
  _ProfileOptionsState createState() => _ProfileOptionsState();
}

class _ProfileOptionsState extends State<ProfileOptions> {

  @override
  Widget build(BuildContext context) {
    final myProfileBloc = BlocProvider.of<MyProfileBloc>(context);

    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          Text(

          SharedPref.getData(key: 'firstName'),
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
           "Traveler name",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 24.0),
          Text(
            SharedPref.getData(key: 'lastName'),
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
         "Traveler Last Name",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 24.0),
          Text(
            SharedPref.getData(key: 'nationality')  ,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
          "Nationality" ,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 24.0),
          Text(
            "Contact",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          ListTile(
            leading: Icon(Icons.email),
            title: Text(
             "Email",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              SharedPref.getData(key: 'email'),
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(height: 30.0),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () {

                Navigator.pushReplacementNamed(context, update);
              },
              child: Text("Edit Profile"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
