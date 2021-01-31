import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school_sawaari_app/models/new_user.dart';
import 'package:school_sawaari_app/screens/complete_profile/pcomplete_profile_screen.dart';
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
    if(!user.emailVerified){
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
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Center(
          child: 
              // Text('An verification link has been sent to $email.'),
              CircularProgressIndicatorApp(),
          ),
        ),
    );
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser;
    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      Navigator.pushReplacementNamed(context, RegistrationSuccessScreen.routeName);
      saveNewUser(email, context);
    }
  }
}
