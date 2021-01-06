import 'package:flutter/widgets.dart';
import 'package:school_sawaari_app/models/verify_email.dart';
import 'package:school_sawaari_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:school_sawaari_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:school_sawaari_app/screens/otp/otp_screen.dart';
import 'package:school_sawaari_app/screens/sign_in/sign_in_screen.dart';
import 'package:school_sawaari_app/screens/splash/splash_screen.dart';

import 'screens/home/bottom_navigation.dart';
import 'screens/home/bottom_navigation.dart';
import 'screens/sign_up/sign_up_screen.dart';


// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  BottomNavigation.routeName: (context) => BottomNavigation(),
  VerifyEmail.routeName: (context) => VerifyEmail(),

};