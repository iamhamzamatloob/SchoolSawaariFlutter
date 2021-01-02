import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:school_sawaari_app/methods/firebase_methods.dart';
import 'package:school_sawaari_app/screens/complete_profile/complete_profile_screen.dart';

  // ignore: deprecated_member_use
  Future<FirebaseUser> saveNewUser(email,context) async{
    
    final CollectionReference users = FirebaseFirestore.instance.collection('Users');
    users.doc(email).set({
      'email' : email,
       'uid' : uid,
       'status': "User Verified",
    }).then((value) => 
    Navigator.pushReplacementNamed(context, CompleteProfileScreen.routeName)).catchError((e){
      print(e);
    });
    return null;
  }