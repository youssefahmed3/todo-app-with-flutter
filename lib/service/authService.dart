import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  late UserCredential? userCredential;

  signInAon() async {
    userCredential = await auth.signInAnonymously();
  }
}
