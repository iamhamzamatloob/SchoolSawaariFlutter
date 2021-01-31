import 'package:flutter/material.dart';

import 'components/dbody.dart';

class DCompleteProfileScreen extends StatelessWidget {
  static String routeName = "/d_complete_profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver'),
      ),
      body: DBody(),
    );
  }
}
