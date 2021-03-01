import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:school_sawaari_app/constants.dart';
import 'package:school_sawaari_app/screens/driver_home/pages/payment_page.dart';
import 'package:school_sawaari_app/screens/driver_home/pages/tracking_page.dart';
import 'package:school_sawaari_app/screens/driver_home/pages/user_profile/user_profile.dart';

class DriverBottomNavigation extends StatefulWidget {
  static String routeName = '/driver_navigation';

  @override
  _DriverBottomNavigationState createState() => _DriverBottomNavigationState();
}

class _DriverBottomNavigationState extends State<DriverBottomNavigation> {
  GlobalKey _bottomNavigationKey = GlobalKey();
  int _pageIndex = 1;

  final DriverTrackingPage _drivertrackingPage = DriverTrackingPage();
  final DriverPaymentPage _driverpaymentPage = DriverPaymentPage();
  final DriverUserPage _driveruserPage = DriverUserPage();

  Widget _showPage = new DriverTrackingPage();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _driverpaymentPage;
        break;

      case 1:
        return _drivertrackingPage;
        break;

      case 2:
        return _driveruserPage;
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
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: _pageIndex,
        height: 50.0,
        items: [
          Icon(
            Icons.payment,
            size: 30.0,
            color: kPrimaryColor,
          ),
          Icon(
            Icons.my_location,
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
            // showLoadingDialog(context);
            _showPage = _pageChooser(tappedIndex);
          });
        },
      ),
      body: Container(
        child: _showPage,
      ),
    );
  }
}
