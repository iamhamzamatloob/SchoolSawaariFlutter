import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:school_sawaari_app/screens/parent_home/p_bottom_navigation.dart';
import 'package:school_sawaari_app/screens/sign_up/verificationts.dart';
import 'package:school_sawaari_app/screens/splash/splash_screen.dart';
import 'methods/firebase_methods.dart';
import 'theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'screens/driver_home/d_bottom_navigation.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  // This widget is the screens.root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String initRoute;
  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null && user.emailVerified)
      return FutureBuilder(
          future: getRole(FirebaseAuth.instance.currentUser.email),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == "Parent")
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'School Sawaari',
                theme: theme(),
                initialRoute: ParentBottomNavigation.routeName,
                routes: routes,
              );
            else if (snapshot.data == "Driver")
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'School Sawaari',
                theme: theme(),
                initialRoute: DriverBottomNavigation.routeName, // DriverBottom
                routes: routes,
              );
            return Container(
              color: Colors.white,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          });
    else
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'School Sawaari',
        theme: theme(),
        initialRoute: SplashScreen.routeName,
        routes: routes,
      );
  }
}