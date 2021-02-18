import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:school_sawaari_app/constants.dart';
import 'package:school_sawaari_app/models/new_user.dart';
import 'package:school_sawaari_app/screens/registration_success/registration_success_screen.dart';
import 'package:school_sawaari_app/widgets/progress_bar.dart';

class VerifyEmail extends StatefulWidget {
  VerifyEmail({Key key}) : super(key: key);
  static String routeName = "/verify_email";

  @override
  _VerifyEmailState createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  final auth = FirebaseAuth.instance;
  User user;
  Timer timer;
  String email;

  @override
  void initState() {
    user = auth.currentUser;
    if (!user.emailVerified) {
      user.sendEmailVerification();
      timer = Timer.periodic(Duration(seconds: 2), (timer) {
        checkEmailVerified();
      });
      super.initState();
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    email = auth.currentUser.email;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitDoubleBounce(
              color: kPrimaryColor,
            ),
            SizedBox(height: 20),
            Text(
              "Verification link has been sent to: ",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.6)),
            ),
            Text(
              "$email",
              style:
              TextStyle(fontWeight: FontWeight.w500, color: kPrimaryColor),
            ),
            SizedBox(height: 5),
            Text("( Verify first to continue! )",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.green)),
          ],
        ),
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser;
    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      Navigator.pushReplacementNamed(
          context, RegistrationSuccessScreen.routeName);
      saveNewUser(email, context);
    }
  }
}
