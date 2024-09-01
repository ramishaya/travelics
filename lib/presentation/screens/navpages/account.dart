import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/const/const.dart';

import '../../../bussines_logic/bloc/bloc/bloc/logout_bloc.dart';
import '../../../bussines_logic/bloc/bloc/logout_state.dart';
import '../../../shared_preffrence.dart';

class Account_Page extends StatefulWidget {
  @override
  _Account_PageState createState() => _Account_PageState();
}

class _Account_PageState extends State<Account_Page> {
  late LogOutBloc
      logOutBloc;
 // Define the LogOutBloc variable at the class level

  void initShared() async {
    await SharedPref.init();
  }

  @override
  void initState() {
    super.initState();
    initShared();
    // Initialize the LogOutBloc inside the initState method
  }

  @override
  Widget build(BuildContext context) {
    logOutBloc = BlocProvider.of<LogOutBloc>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
         "Account",
          style: TextStyle(
              fontFamily: 'Raleway', fontSize: 24, color: Colors.white),
        ),
        backgroundColor: Color(kPrimaryColor),
        leading: IconButton(
          color: Color(kOurColor),
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacementNamed(context, home);
          },
        ),
        elevation: 0,
      ),
      body: buildAccountPage(context),
    );
  }

  Widget buildAccountPage(BuildContext context) {
    return BlocConsumer<LogOutBloc, LogOutState>(
      listener: (context, state) {
        if (state is LogOutSuccess) {
          print('token before=${SharedPref.getData(key: 'token')}');
          SharedPref.removeData(key: 'token');
          print('token after=${SharedPref.getData(key: 'token')}');

          Navigator.pushReplacementNamed(context, welcomePage);
        } else if (state is LogOutFailedState) {
          // Handle logout failure
          // You can show an error message or perform any other action here
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(kPrimaryColor),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Row(
                children: [
                  // CircleAvatar(
                  //   radius: 40,
                  //   backgroundColor: Colors.blue.shade400,
                  //   //     backgroundImage: AssetImage('wing2.jpg'),
                  // ),
                  SizedBox(width: 16),
                  Text(
                    SharedPref.getData(key:'firstName'),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            buildListTile(context, Icons.account_circle,"My Profile", () {
              // Navigate to the profile screen
              Navigator.pushReplacementNamed(context, profil);
            }),
            buildDivider(),
            buildListTile(context, Icons.settings,"Setting", () {
       //       Navigator.pushReplacementNamed(context, settingsPage);
       //!
            }),
            buildDivider(),
            buildListTile(context, Icons.help, "Help Support", () {

            }),
            buildDivider(),
            buildListTile(context, Icons.logout,"Logout", () async {
              logOutBloc.LogOut();
            }),
          ],
        );
      },
    );
  }

  Widget buildListTile(
      BuildContext context, IconData icon, String title, Function() onTap) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      leading: Icon(icon, size: 35, color: Colors.blue),
      title: Text(title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
      onTap: onTap,
    );
  }

  Widget buildDivider() {
    return Divider(
      thickness: 1.5,
      indent: 20,
      endIndent: 20,
    );
  }
}
