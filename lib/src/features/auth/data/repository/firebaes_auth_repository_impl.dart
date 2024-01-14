import 'package:chat_application/src/features/auth/domain/repository/firebase_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepositoryImpl extends FirebaseAuthRepository {
  @override
  Future<UserCredential> signin(String email, String password) {
    return FirebaseAuth.instance
        .signInWithEmailAndPassword(
          email: email,
          password: password,
        )
        .timeout(const Duration(seconds: 15));
  }
}
