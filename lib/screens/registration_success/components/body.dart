import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:school_sawaari_app/components/default_button.dart';
import 'package:school_sawaari_app/methods/firebase_methods.dart';
import 'package:school_sawaari_app/screens/complete_profile/dcomplete_profile_screen.dart';
import 'package:school_sawaari_app/screens/complete_profile/pcomplete_profile_screen.dart';
import 'package:school_sawaari_app/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int radioValue = 0;
  String variable;

  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
      if (radioValue == 0)
        variable = "Parent";
      else
        variable = "Driver";
      // print(variable);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Text(
          "Registration Success",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text('Are you a Parent or Driver?'),
        SizedBox(height: getProportionateScreenHeight(3)),
        Text('Please select one!'),
        SizedBox(height: getProportionateScreenHeight(8)),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.elderly_outlined),
              Radio(
                value: 0,
                groupValue: radioValue,
                onChanged: handleRadioValueChanged,
              ),
              Text(
                'Parent',
                style: new TextStyle(fontSize: 16.0),
              ),
              SizedBox(
                width: 50,
              ),
              Icon(Icons.drive_eta_sharp),
              Radio(
                value: 1,
                groupValue: radioValue,
                onChanged: handleRadioValueChanged,
              ),
              Text(
                'Driver',
                style: new TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Next",
            press: () async {
              // Navigator.pushNamed(context, HomeScreen.routeName);
              if (variable == 'Parent')
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => PCompleteProfileScreen()));
              else if (variable == 'Driver')
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => DCompleteProfileScreen()));
              await FirebaseFirestore.instance
                  .collection('Users')
                  .doc(auth.currentUser.email)
                  .update({
                'Role': variable,
              });
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
