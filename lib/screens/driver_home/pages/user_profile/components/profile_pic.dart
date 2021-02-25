import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:school_sawaari_app/constants.dart';

class DriverProfilePic extends StatefulWidget {
  const DriverProfilePic({
    Key key,
  }) : super(key: key);

  @override
  _DriverProfilePicState createState() => _DriverProfilePicState();
}

class _DriverProfilePicState extends State<DriverProfilePic> {
  File file;
  User user = FirebaseAuth.instance.currentUser;

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.getImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );
    setState(() {});
    file = File(imageFile.path);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        // ignore: deprecated_member_use
        overflow: Overflow.visible,
        children: [
          user.photoURL == null || user.photoURL == ""
              ? CircleAvatar(
                  backgroundColor: kPrimaryColor,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(70),
                    child: Image.asset(
                      'assets/images/Hamza Profile.png',
                      width: 110,
                      height: 110,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : CircleAvatar(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(70),
                    child: Image.network(
                        FirebaseAuth.instance.currentUser.photoURL,
                        width: 110,
                        height: 110,
                        fit: BoxFit.cover),
                  ),
                ),
          Positioned(
            right: -12,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: FlatButton(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: BorderSide(color: Colors.white),
                ),
                color: Color(0xFFF5F6F9),
                onPressed: _takePicture,
                child: SvgPicture.asset('assets/icons/Camera Icon.svg'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// file == null? CircleAvatar(
// backgroundImage: AssetImage('assets/images/Hamza Profile.png'),
// ): Image.file(file),
