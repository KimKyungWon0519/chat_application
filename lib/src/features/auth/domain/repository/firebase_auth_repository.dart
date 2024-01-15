import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthRepository {
  Future<UserCredential> signin(String email, String password);
  Future<UserCredential> signup(String email, String password);
  Future<void> changeUserName(User user, String name);
  Future<void> sendEmailVertification(User user);
}
