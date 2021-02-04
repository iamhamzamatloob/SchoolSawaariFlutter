import 'package:flutter/material.dart';

import 'components/pbody.dart';

class PCompleteProfileScreen extends StatelessWidget {
  static String routeName = "/p_complete_profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parents'),
      ),
      body: PBody(),
    );
  }
}
