import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:school_sawaari_app/screens/parent_home/p_bottom_navigation.dart';
import 'package:school_sawaari_app/screens/splash/splash_screen.dart';
import 'models/verify_email.dart';
import 'methods/firebase_methods.dart';
import 'theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'screens/driver_home/d_bottom_navigation.dart';
import 'routes.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
  @override
  Widget build(BuildContext context) {
     if(FirebaseAuth.instance.currentUser != null)
       return FutureBuilder(
           initialData: [],
           future: getRole(FirebaseAuth.instance.currentUser.email),
           builder: (BuildContext context, AsyncSnapshot snapshot) {
             print(snapshot.data);
             String initRoute;

             initRoute = snapshot.data == "Driver"
                 ? DriverBottomNavigation.routeName
                 : ParentBottomNavigation.routeName;
             return MaterialApp(
               debugShowCheckedModeBanner: false,
               title: 'School Sawaari',
               theme: theme(),
               initialRoute: initRoute,
               routes: routes,
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