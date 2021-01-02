import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school_sawaari_app/screens/home/bottom_navigation.dart';
import 'package:school_sawaari_app/screens/splash/components/body.dart';
import 'package:school_sawaari_app/size_config.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash_screen";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 0);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    var auth = FirebaseAuth.instance;
    // ignore: deprecated_member_use
    auth.onAuthStateChanged.listen((user) {
      if (user != null) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => BottomNavigation()),
                (Route<dynamic> route) => false);
      } else {}
    });
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
