import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school_sawaari_app/constants.dart';
import 'package:school_sawaari_app/screens/sign_in/sign_in_screen.dart';
import 'package:school_sawaari_app/screens/splash/splash_screen.dart';
import 'package:school_sawaari_app/widgets/snack_bar.dart';
import 'package:school_sawaari_app/screens/home/pages/user_profile/components/body.dart';

class UserPage extends StatelessWidget {
  static String routeName = '/user_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(
              fontFamily: 'Muli', color: Color(0XFF8B8B8B), fontSize: 18),
        ),
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
      ),
      body: Body(),
    );
  }
}
