import 'package:flutter/material.dart';
import 'package:school_sawaari_app/components/custom_surfix_icon.dart';
import 'package:school_sawaari_app/components/default_button.dart';
import 'package:school_sawaari_app/components/form_error.dart';
import 'package:school_sawaari_app/screens/driver_home/d_bottom_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:school_sawaari_app/screens/sign_up/verificationts.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class DCompleteProfileForm extends StatefulWidget {
  @override
  _DCompleteProfileFormState createState() => _DCompleteProfileFormState();
}

class _DCompleteProfileFormState extends State<DCompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];

  String name;
  String cnic;
  String address;
  String phoneNo;
  String vehicleRegistrationNo;
  String vehicleNumberPlate;
  String drivingLicenseNumber;

  final auth = FirebaseAuth.instance;
  User user;
  DateTime selectedDate;

  @override
  initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  //End

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildCNICFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildVehicleRegistrationFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildVehicleNumberPlateFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildDrivingLicenseNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continue",
            press: () async {
              // Navigator.pushNamed(context, Verifications.routeName);
              if (_formKey.currentState.validate()) {
                try {
                  await FirebaseFirestore.instance
                      .collection('Drivers')
                      .doc(auth.currentUser.email)
                      .set({
                    'Name': name,
                    'CNIC': cnic,
                    'Address': address,
                    'PhoneNo': phoneNo,
                    'VehicleRegistrationNumber': vehicleRegistrationNo,
                    'VehiclePlateNumber': vehicleNumberPlate,
                    'DrivingLicenseNumber': drivingLicenseNumber,
                    'Email': FirebaseAuth.instance.currentUser.email,
                  });
                  Navigator.pushNamed(
                      context, Verifications.routeName);
                } catch (e) {
                  print(e);
                }
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        address = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Address",
        hintText: "Enter your Home address",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildDrivingLicenseNumberFormField() {
    return TextFormField(
      onSaved: (newValue) => drivingLicenseNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kDrivingLicenseNumber);
        }
        drivingLicenseNumber = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kDrivingLicenseNumber);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Driving License Number",
        hintText: "Enter your DL number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/driving-license.svg"),
      ),
    );
  }

  TextFormField buildVehicleNumberPlateFormField() {
    return TextFormField(
      onSaved: (newValue) => vehicleNumberPlate = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNumberPlateError);
        }
        vehicleNumberPlate = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNumberPlateError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Vehicle Number Plate",
        hintText: "Enter your vehicle plate number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/license-plate.svg"),
      ),
    );
  }

  TextFormField buildVehicleRegistrationFormField() {
    return TextFormField(
      onSaved: (newValue) => vehicleRegistrationNo = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kRegistrationError);
        }
        vehicleRegistrationNo = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kRegistrationError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Vehicle Registration",
        hintText: "Enter your vehicle registration number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/van.svg"),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      initialValue: '+92',
      maxLength: 13,
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNo = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        phoneNo = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildCNICFormField() {
    return TextFormField(
      onSaved: (newValue) => cnic = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kCNICError);
        }
        cnic = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kCNICError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "CNIC",
        hintText: "Enter your CNIC",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/card.svg"),
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      onSaved: (newValue) => name = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        name = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Name",
        hintText: "Enter your name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}
