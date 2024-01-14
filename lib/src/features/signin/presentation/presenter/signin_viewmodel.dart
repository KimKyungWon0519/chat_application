import 'package:chat_application/src/features/signin/domain/usecase/firebae_auth_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SigninViewModel {
  final FirebaseAuthUseCase _firebaseAuthUseCase;

  String email = '';
  String password = '';

  SigninViewModel({
    required FirebaseAuthUseCase firebaseAuthUseCase,
  }) : _firebaseAuthUseCase = firebaseAuthUseCase;

  Future<UserCredential> signin() {
    return _firebaseAuthUseCase.signin(email, password);
  }
}
