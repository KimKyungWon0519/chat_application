import 'package:chat_application/src/features/account_management/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<void> signout() {
    return FirebaseAuth.instance.signOut();
  }
}
