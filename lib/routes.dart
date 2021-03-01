import 'package:flutter/widgets.dart';
import 'package:school_sawaari_app/models/verify_email.dart';
import 'package:school_sawaari_app/screens/complete_profile/pcomplete_profile_screen.dart';
import 'package:school_sawaari_app/screens/driver_home/d_bottom_navigation.dart';
import 'package:school_sawaari_app/screens/edit_profiles/driver_edit_profile.dart';
import 'package:school_sawaari_app/screens/edit_profiles/parent_edit_profile.dart';
import 'package:school_sawaari_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:school_sawaari_app/screens/otp/otp_screen.dart';
import 'package:school_sawaari_app/screens/parent_home/p_bottom_navigation.dart';
import 'package:school_sawaari_app/screens/registration_success/registration_success_screen.dart';
import 'package:school_sawaari_app/screens/sign_in/sign_in_screen.dart';
import 'package:school_sawaari_app/screens/sign_up/verificationts.dart';
import 'package:school_sawaari_app/screens/splash/splash_screen.dart';
import 'screens/sign_up/sign_up_screen.dart';


// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  PCompleteProfileScreen.routeName: (context) => PCompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  ParentBottomNavigation.routeName: (context) => ParentBottomNavigation(),
  VerifyEmail.routeName: (context) => VerifyEmail(),
  RegistrationSuccessScreen.routeName: (context) => RegistrationSuccessScreen(),
  DriverBottomNavigation.routeName: (context) => DriverBottomNavigation(),
  Verifications.routeName: (context) => Verifications(),
  DriverEditProfile.routeName: (context) => DriverEditProfile(),
  ParentEditProfile.routeName: (context) => ParentEditProfile()
};
