import 'package:chat_application/src/core/values/exceptions/signin_exception.dart';
import 'package:chat_application/src/features/auth/domain/usecase/firebae_auth_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SigninViewModel {
  final SigninUseCase _signinUseCase;

  String email = '';
  String password = '';

  SigninViewModel({
    required SigninUseCase signinUseCase,
  }) : _signinUseCase = signinUseCase;

  Future<void> signin() async {
    UserCredential user = await _signinUseCase.signin(email, password);

    if (!user.user!.emailVerified) {
      throw const NotVerifiedMail();
    }
  }
}
