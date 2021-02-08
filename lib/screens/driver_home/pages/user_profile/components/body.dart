import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:school_sawaari_app/constants.dart';
import 'package:school_sawaari_app/screens/driver_home/pages/user_profile/components/profile_menu.dart';
import 'package:school_sawaari_app/screens/driver_home/pages/user_profile/components/profile_pic.dart';
import 'package:school_sawaari_app/screens/sign_in/sign_in_screen.dart';
import 'package:school_sawaari_app/widgets/snack_bar.dart';

class DriverBody extends StatefulWidget {
  @override
  _DriverBodyState createState() => _DriverBodyState();
}

class _DriverBodyState extends State<DriverBody> {
  // Future<void> signOut() async {
  //   await FirebaseAuth.instance
  //       .signOut()
  //       .then((currentUser) => Navigator.of(context).pushAndRemoveUntil(
  //       MaterialPageRoute(builder: (context) => SignInScreen()),
  //           (Route<dynamic> route) => false)
  //   )
  //       .catchError((e) {
  //     Snack_Bar.show(context, e.message);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DriverProfilePic(),
            SizedBox(
              height: 10,
            ),
            DriverProfileMenu(
              icon: 'assets/icons/User Icon.svg',
              text: 'My Account',
              press: () {},
            ),
            DriverProfileMenu(
              icon: 'assets/icons/Settings.svg',
              text: 'Settings',
              press: () {},
            ),
            DriverProfileMenu(
              icon: 'assets/icons/Question mark.svg',
              text: 'Help Center',
              press: () {},
            ),
            DriverProfileMenu(
              icon: 'assets/icons/Log out.svg',
              text: 'Log Out',
              press: () async {
                FirebaseAuth.instance.signOut().whenComplete(() {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                  );
                }).catchError((e) {
                  Snack_Bar.show(context, e.message);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
