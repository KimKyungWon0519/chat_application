import 'package:chat_application/src/features/auth/domain/repository/firebase_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SigninUseCase {
  final FirebaseAuthRepository _firebaseAuthRepository;

  const SigninUseCase({
    required FirebaseAuthRepository firebaseAuthRepository,
  }) : _firebaseAuthRepository = firebaseAuthRepository;

  Future<UserCredential> signin(String email, String password) {
    return _firebaseAuthRepository.signin(email, password);
  }
}

class SignUpUseCase {
  final FirebaseAuthRepository _firebaseAuthRepository;

  const SignUpUseCase({
    required FirebaseAuthRepository firebaseAuthRepository,
  }) : _firebaseAuthRepository = firebaseAuthRepository;

  Future<UserCredential> signup(String email, String password) {
    return _firebaseAuthRepository.signup(email, password);
  }

  Future<void> sendEmailVerification(User user) {
    return _firebaseAuthRepository.sendEmailVertification(user);
  }
}
