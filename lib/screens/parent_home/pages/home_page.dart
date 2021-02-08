import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String routeName = '/home_page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Home Page',
          style: TextStyle(
              fontFamily: 'Muli', color: Color(0XFF8B8B8B), fontSize: 18),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Center(child: Text('Home')),
      ),
    );
  }
}
