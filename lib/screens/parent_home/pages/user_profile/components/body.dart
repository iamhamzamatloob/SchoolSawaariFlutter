import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:school_sawaari_app/constants.dart';
import 'package:school_sawaari_app/screens/parent_home/pages/user_profile/components/profile_menu.dart';
import 'package:school_sawaari_app/screens/parent_home/pages/user_profile/components/profile_pic.dart';
import 'package:school_sawaari_app/screens/sign_in/sign_in_screen.dart';
import 'package:school_sawaari_app/widgets/snack_bar.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // Future<void> signOut() async {
  //   await FirebaseFirestore.instance.terminate();
  //   await FirebaseFirestore.instance.clearPersistence();
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
            ProfilePic(),
            SizedBox(
              height: 10,
            ),
            ProfileMenu(
              icon: 'assets/icons/User Icon.svg',
              text: 'My Account',
              press: () {},
            ),
            ProfileMenu(
              icon: 'assets/icons/Settings.svg',
              text: 'Settings',
              press: () {},
            ),
            ProfileMenu(
              icon: 'assets/icons/Question mark.svg',
              text: 'Help Center',
              press: () {},
            ),
            ProfileMenu(
              icon: 'assets/icons/Log out.svg',
              text: 'Log Out',
              press:
                  () {
                // FirebaseAuth.instance.signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
