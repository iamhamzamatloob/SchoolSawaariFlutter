import 'package:flutter/material.dart';
import 'package:school_sawaari_app/constants.dart';

class TrackingPage extends StatefulWidget {
  final String routeName = '/tracking_page';
  @override
  _TrackingPageState createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Tracking Page',
          style: TextStyle(
              fontFamily: 'Muli', color: Color(0XFF8B8B8B), fontSize: 18),
        ),
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: kPrimaryColor,
        child: Center(child: Text('Tracking')),
      ),
    );
  }
}
