import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tourism/const/const.dart';

import '../../../bussines_logic/bloc/bloc/bloc/bloc/update_profile_bloc_bloc.dart';
import '../../../bussines_logic/bloc/bloc/bloc/bloc/update_profile_bloc_event.dart';
import '../../../bussines_logic/bloc/bloc/bloc/bloc/update_profile_bloc_state.dart';
import '../../../bussines_logic/bloc/bloc/my_profile_bloc_bloc.dart';
import '../../../shared_preffrence.dart';

class Edit_Profile_Page extends StatefulWidget {
  @override
  _Edit_Profile_PageState createState() => _Edit_Profile_PageState();
}

class _Edit_Profile_PageState extends State<Edit_Profile_Page> {
  final TextEditingController _fnameController = TextEditingController();
  final TextEditingController _lnameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _nationalityController = TextEditingController();
  File? _image;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  void initShared() async {
    await SharedPref.init();
  }

  @override
  void initState() {
    super.initState();
    initShared();
  }

  Future getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  void dispose() {
    _image?.delete();
    // Cleanup the selected image file
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UpdateProfileBloc updateProfileBloc =
        BlocProvider.of<UpdateProfileBloc>(context);
    final MyProfileBloc myProfileBloc = BlocProvider.of<MyProfileBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: TextStyle(
              fontFamily: 'Raleway', fontSize: 24, color: Colors.white),
        ),
        backgroundColor: Color(kPrimaryColor),
        elevation: 0,
        leading: IconButton(
          color: Color(kPrimaryColor),
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacementNamed(context, profil);
          },
        ),
      ),
      body: BlocConsumer<UpdateProfileBloc, UpdateProfileState>(
        listener: (context, state) {
          if (state is UserUpdateProfileSuccessState) {
            print("sssssssssssssssssssssssss");
            myProfileBloc.MyProfile();
            print("sssssssssssssssssssssssss");
            Navigator.pushReplacementNamed(context, profil);
            // // Fetch the updated profile data after successful update
          }
        },
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(kPrimaryColor), Colors.white],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: ListView(
                    children: [
                      GestureDetector(
                        onTap: getImage,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            CircleAvatar(
                              radius: 64.0,
                              backgroundColor: Colors.blue,
                              backgroundImage: _image == null
                                  ? AssetImage('assets/images/logo.jpg')
                                      as ImageProvider<Object>
                                  : FileImage(_image!) as ImageProvider<Object>,
                            ),
                            CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.blue,
                              child: Icon(Icons.edit,
                                  size: 14, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Form(
                        key: formstate,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _fnameController,
                              decoration: InputDecoration(
                                labelText: "Traveler Name",
                                icon: Icon(Icons.person,
                                    color: Color(kPrimaryColor)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your first name';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 15),
                            TextFormField(
                              controller: _lnameController,
                              decoration: InputDecoration(
                                labelText: "last name",
                                icon: Icon(Icons.person,
                                    color: Color(kPrimaryColor)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your last name';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 15),
                            TextFormField(
                              controller: _nationalityController,
                              decoration: InputDecoration(
                                labelText: "nationality",
                                icon: Icon(Icons.flag,
                                    color: Color(kPrimaryColor)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your nationality';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 15),
                            TextFormField(
                              controller: _genderController,
                              decoration: InputDecoration(
                                labelText: "Gender",
                                icon: Icon(Icons.question_mark,
                                    color: Color(kPrimaryColor)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your gender';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 30),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                textStyle: TextStyle(
                                    fontFamily: 'Raleway', fontSize: 18),
                              ),
                              onPressed: () {
                                if (formstate.currentState!.validate()) {
                                  updateProfileBloc.add(UserUpdateProfileEvent(
                                    First_name: _fnameController.text,
                                    Last_name: _lnameController.text,
                                    nationality: _nationalityController.text,
                                    gender: _genderController.text,
                                    image: _image,
                                  ));
                                }
                              },
                              child: Text("Save Change"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
