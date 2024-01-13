import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthClient {
  Future<UserCredential> signin(String email, String password) {
    return FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
