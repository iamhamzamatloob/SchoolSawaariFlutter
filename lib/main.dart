import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:school_sawaari_app/screens/splash/splash_screen.dart';
import 'theme.dart';
import 'constants.dart';
import 'routes.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the screens.root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
