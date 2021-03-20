import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:provider/provider.dart';
import 'package:school_sawaari_app/constants.dart';
import 'package:school_sawaari_app/data_handler/app_data.dart';
import 'package:school_sawaari_app/screens/parent_home/pages/home_page.dart';
import 'package:school_sawaari_app/screens/parent_home/pages/payment_page.dart';
import 'package:school_sawaari_app/screens/parent_home/pages/tracking_page.dart';
import 'package:school_sawaari_app/screens/parent_home/pages/user_profile/user_profile.dart';

class ParentBottomNavigation extends StatefulWidget {
  static String routeName = '/parent_navigation';

  @override
  _ParentBottomNavigationState createState() => _ParentBottomNavigationState();
}

class _ParentBottomNavigationState extends State<ParentBottomNavigation> {
  GlobalKey _bottomNavigationKey = GlobalKey();
  int _pageIndex = 0;

  final HomePage _homePage = HomePage();
  final TrackingPage _trackingPage = TrackingPage();
  final PaymentPage _paymentPage = PaymentPage();
  final UserPage _userPage = UserPage();

  Widget _showPage = new HomePage();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _homePage;
        break;

      case 1:
        return _trackingPage;
        break;

      case 2:
        return _paymentPage;
        break;

      case 3:
        return _userPage;
        break;
      default:
        return Container(
            child: Center(
                child: Text(
          'No Page Found',
          style: TextStyle(fontSize: 30),
        )));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppData>(
      create: (context) => AppData(),
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: _pageIndex,
          height: 50.0,
          items: [
            Icon(
              Icons.home,
              size: 30.0,
              color: kPrimaryColor,
            ),
            Icon(
              Icons.my_location,
              size: 30.0,
              color: kPrimaryColor,
            ),
            Icon(
              Icons.payment,
              size: 30.0,
              color: kPrimaryColor,
            ),
            Icon(
              Icons.person_rounded,
              size: 30.0,
              color: kPrimaryColor,
            ),
          ],
          backgroundColor: Colors.white,
          buttonBackgroundColor: Colors.white70,
          color: hexColor,
          animationDuration: Duration(milliseconds: 400),
          onTap: (int tappedIndex) {
            setState(() {
              _showPage = _pageChooser(tappedIndex);
            });
          },
        ),
        body: Container(
          child: _showPage,
        ),
      ),
    );
  }
}
