import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:school_sawaari_app/screens/driver_home/d_bottom_navigation.dart';
import 'package:school_sawaari_app/size_config.dart';

import '../../constants.dart';

class Verifications extends StatefulWidget {
  static String routeName = "/verifications";

  @override
  _VerificationsState createState() => _VerificationsState();
}

class _VerificationsState extends State<Verifications> {
  int currentStep = 0;
  String storePhoneNo;
  File _cnicFrontPhoto;
  File _cnicBackPhoto;
  File _userPic;
  File _licenseFront;
  File _licenseBack;
  final email = FirebaseAuth.instance.currentUser.email;
  var downUrl;
  var downUrl1;
  var downUrl2;
  var downUrl3;
  var downUrl4;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Documents Verification",
          style: TextStyle(color: Color(0XFF8B8B8B),),
        ),
        elevation: 2,
        centerTitle: true,
      ),
      body: Container(
        child: Stepper(
          currentStep: this.currentStep,
          steps: [
            Step(title: Text("CNIC"), content: cnic(), isActive: true),
            Step(
                title: Text("Driving License"),
                content: license(),
                state: StepState.editing,
                isActive: true),
          ],
          type: StepperType.vertical,
          onStepTapped: (step) {
            setState(() {
              currentStep = step;
            });
          },
          onStepCancel: () {
            setState(() {
              if (currentStep > 0) {
                currentStep = currentStep - 1;
              } else {
                currentStep = 0;
              }
            });
          },
          onStepContinue: () {
            setState(() {
              if (currentStep < 2 - 1) {
                currentStep = currentStep + 1;
              } else {
                currentStep = 0;
              }
            });
          },
        ),
      ),
    );
  }

  cnic() {
    return Column(
      children: [
        Container(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(10)),
              Text(
                'CNIC front side Photo',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: kPrimaryColor,
                  child: Padding(
                    padding: EdgeInsets.all(1.5),
                    child: Stack(
                      children: [
                        Container(
                          width: 400,
                          height: 200,
                          child: _cnicFrontPhoto != null
                              ? ClipRRect(
                                  child: Image.file(
                                    _cnicFrontPhoto,
                                    width: 400,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                  ),
                                  width: 400,
                                  height: 200,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.grey[800],
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              RaisedButton(
                color: Colors.green,
                child: Text('ADD'),
                onPressed: () {
                  _cnicFrontSide();
                },
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              Container(
                height: 3,
                color: hexColor,
              ),
              Text(
                'CNIC back side Photo',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: kPrimaryColor,
                  child: Padding(
                    padding: EdgeInsets.all(1.5),
                    child: Stack(
                      children: [
                        Container(
                          width: 400,
                          height: 200,
                          child: _cnicBackPhoto != null
                              ? ClipRRect(
                                  child: Image.file(
                                    _cnicBackPhoto,
                                    width: 400,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                  ),
                                  width: 400,
                                  height: 200,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.grey[800],
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              RaisedButton(
                color: Colors.green,
                child: Text('ADD'),
                onPressed: () {
                  _cnicBackSide();
                },
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              Container(
                height: 3,
                color: hexColor,
              ),
              Text(
                'Upload your photo(For security verifications only)',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: kPrimaryColor,
                  child: Padding(
                    padding: EdgeInsets.all(1.5),
                    child: Stack(
                      children: [
                        Container(
                          width: 400,
                          height: 200,
                          child: _userPic != null
                              ? ClipRRect(
                                  child: Image.file(
                                    _userPic,
                                    width: 400,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                  ),
                                  width: 400,
                                  height: 200,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.grey[800],
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Text(
                'This photo will be used as your profile photo',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
              RaisedButton(
                color: Colors.green,
                child: Text('ADD'),
                onPressed: () {
                  _userPhoto();
                },
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
            ],
          ),
        ),
      ],
    );
  }

  license() {
    return Column(
      children: [
        Container(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(10)),
              Text(
                'License front side Photo',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: kPrimaryColor,
                  child: Padding(
                    padding: EdgeInsets.all(1.5),
                    child: Stack(
                      children: [
                        Container(
                          width: 400,
                          height: 200,
                          child: _licenseFront != null
                              ? ClipRRect(
                                  child: Image.file(
                                    _licenseFront,
                                    width: 400,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                  ),
                                  width: 400,
                                  height: 200,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.grey[800],
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              RaisedButton(
                color: Colors.green,
                child: Text('ADD'),
                onPressed: () {
                  _licenseFrontSide();
                },
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              Container(
                height: 3,
                color: hexColor,
              ),
              Text(
                'License back side Photo',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: kPrimaryColor,
                  child: Padding(
                    padding: EdgeInsets.all(1.5),
                    child: Stack(
                      children: [
                        Container(
                          width: 400,
                          height: 200,
                          child: _licenseBack != null
                              ? ClipRRect(
                                  child: Image.file(
                                    _licenseBack,
                                    width: 400,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                  ),
                                  width: 400,
                                  height: 200,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.grey[800],
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              RaisedButton(
                color: Colors.green,
                child: Text('ADD'),
                onPressed: () {
                  _licenseBackSide();
                },
              ),
              SizedBox(height: getProportionateScreenHeight(50)),
              RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 110, vertical: 5),
                color: kPrimaryColor,
                child: Text('Submit'),
                onPressed: () {
                  if (downUrl == null ||
                      downUrl1 == null ||
                      downUrl2 == null ||
                      downUrl3 == null ||
                      downUrl4 == null) {
                    print("Please add all pictures!");
                    // print(downUrl);
                    // print(downUrl1);
                    // print(downUrl2);
                    // print(downUrl3);
                    // print(downUrl4);
                  }
                  else
                    {
                      updateData();
                      Navigator.pushReplacementNamed(context, DriverBottomNavigation.routeName);
                    }
                },
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
            ],
          ),
        ),
      ],
    );
  }

  _cnicFrontSide() async {
    // ignore: deprecated_member_use
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _cnicFrontPhoto = image;
      uploadCNICfs();
    });
  }

  _cnicBackSide() async {
    // ignore: deprecated_member_use
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _cnicBackPhoto = image;
      uploadCNICbs();
    });
  }

  _userPhoto() async {
    // ignore: deprecated_member_use
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _userPic = image;
      uploadUserPhoto();
    });
  }

  _licenseFrontSide() async {
    // ignore: deprecated_member_use
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _licenseFront = image;
      uploadLICENSEfs();
    });
  }

  _licenseBackSide() async {
    // ignore: deprecated_member_use
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _licenseBack = image;
      uploadLICENSEbs();
    });
  }

  uploadCNICfs() async {
    final sref =
        FirebaseStorage.instance.ref().child('CNICs/$email/FrontSide.jpg');
    sref.putFile(_cnicFrontPhoto);
    //ignore: unnecessary_cast
    downUrl = await sref.getDownloadURL() as String;
  }

  uploadCNICbs() async {
    final sref1 =
        FirebaseStorage.instance.ref().child('CNICs/$email/BackSide.jpg');
    sref1.putFile(_cnicBackPhoto);
    //ignore: unnecessary_cast
    downUrl1 = await sref1.getDownloadURL() as String;
  }

  uploadUserPhoto() async {
    final sref2 = FirebaseStorage.instance.ref().child('User Photo/$email.jpg');
    sref2.putFile(_userPic);
    //ignore: unnecessary_cast
    downUrl2 = await sref2.getDownloadURL() as String;
  }

  uploadLICENSEfs() async {
    final sref3 =
        FirebaseStorage.instance.ref().child('LICENSES/$email/FrontSide.jpg');
    sref3.putFile(_licenseFront);
    //ignore: unnecessary_cast
    downUrl3 = await sref3.getDownloadURL() as String;
  }

  uploadLICENSEbs() async {
    final sref4 =
        FirebaseStorage.instance.ref().child('LICENSES/$email/FrontSide.jpg');
    sref4.putFile(_licenseBack);
    //ignore: unnecessary_cast
    downUrl4 = await sref4.getDownloadURL() as String;
  }

  Future updateData() async{
    await FirebaseFirestore.instance.collection('Users').doc(email).update({
      'User Photo': downUrl2,
      'CNIC FS': downUrl,
      'CNIC BS': downUrl1,
      'LICENSE FS': downUrl3,
      'LICENSE BS': downUrl4,
    }).then((value) => {
      FirebaseAuth.instance.currentUser.updateProfile(photoURL: downUrl2),
      Navigator.pushReplacementNamed(context, DriverBottomNavigation.routeName)
    });
  }
}
