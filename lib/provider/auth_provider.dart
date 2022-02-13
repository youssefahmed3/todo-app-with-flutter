import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:todo_app_no_signin/service/authService.dart';

class Auth extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;

  UserCredential? userCredential;
  String? uid;
  signInAon() async {
    userCredential = await auth.signInAnonymously();
    uid = userCredential!.user!.uid;
  }
}
