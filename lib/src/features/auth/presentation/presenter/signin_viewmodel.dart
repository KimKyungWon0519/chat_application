import 'package:chat_application/src/features/auth/domain/usecase/firebae_auth_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SigninViewModel {
  final SigninUseCase _signinUseCase;

  String email = '';
  String password = '';

  SigninViewModel({
    required SigninUseCase signinUseCase,
  }) : _signinUseCase = signinUseCase;

  Future<UserCredential> signin() {
    return _signinUseCase.signin(email, password);
  }
}
