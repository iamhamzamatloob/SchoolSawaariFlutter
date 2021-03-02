import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_sawaari_app/constants.dart';

class DriverProfilePic extends StatefulWidget {
  const DriverProfilePic({
    Key key,
  }) : super(key: key);

  @override
  _DriverProfilePicState createState() => _DriverProfilePicState();
}

class _DriverProfilePicState extends State<DriverProfilePic> {

  // final email = FirebaseAuth.instance.currentUser.email;
  // var downUrl2;
  //
  // File file;
  User user = FirebaseAuth.instance.currentUser;

  // Future<void> takePicture() async {
  //   File image = await ImagePicker.pickImage(
  //       source: ImageSource.gallery, imageQuality: 50);
  //
  //   setState(() {
  //     file = image;
  //     uploadProfilePhoto();
  //   });
  // }

  // uploadProfilePhoto() async{
  //   showLoadingDialog(context);
  //   final sref2 = FirebaseStorage.instance.ref().child('User Photo/$email.jpg');
  //   sref2.putFile(file);
  //   //ignore: unnecessary_cast
  //   downUrl2 = await sref2.getDownloadURL() as String;
  //   FirebaseAuth.instance.currentUser.updateProfile(photoURL: downUrl2);
  //   FirebaseFirestore.instance.collection('Users').doc(email).update({
  //     'User Photo': downUrl2,
  //   }).then((value) => setState((){
  //     Navigator.pop(context);
  //     setState(() {
  //       FirebaseAuth.instance.currentUser.photoURL;
  //     });
  //
  //   }));
  // }
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
           CircleAvatar(
                  backgroundColor: kPrimaryColor.withOpacity(0.8),
                  child: user.photoURL == null || user.photoURL == "" ?
                  ClipRRect(
                    borderRadius: BorderRadius.circular(70),
                    child: Image.asset(
                      'assets/images/User.jpeg',
                      width: 110,
                      height: 110,
                      fit: BoxFit.cover,
                    ),
                  ) : ClipRRect(
                    borderRadius: BorderRadius.circular(70),
                    child: FadeInImage.assetNetwork(
                        image: FirebaseAuth.instance.currentUser.photoURL,
                        placeholder: 'assets/images/Bubble-Loader-Icon.gif',
                        width: 110,
                        height: 110,
                        fit: BoxFit.cover),
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