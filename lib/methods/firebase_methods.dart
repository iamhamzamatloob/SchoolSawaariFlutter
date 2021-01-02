import 'package:firebase_auth/firebase_auth.dart';

final auth = FirebaseAuth.instance;
String uid = auth.currentUser.uid.toString();
User user = auth.currentUser;