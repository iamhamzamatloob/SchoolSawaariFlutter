import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:school_sawaari_app/constants.dart';
import 'package:school_sawaari_app/screens/home/pages/user_profile/components/profile_menu.dart';
import 'package:school_sawaari_app/screens/home/pages/user_profile/components/profile_pic.dart';

class Body extends StatelessWidget {
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
              icon: 'assets/icons/Bell.svg',
              text: 'Notifications',
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
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
