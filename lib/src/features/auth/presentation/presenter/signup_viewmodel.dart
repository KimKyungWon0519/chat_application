import 'package:chat_application/src/features/auth/domain/usecase/firebae_auth_usecase.dart';

class SignupViewModel {
  final SignUpUseCase _signUpUseCase;

  String email = '';
  String password = '';
  String name = '';

  SignupViewModel({
    required SignUpUseCase signUpUseCase,
  }) : _signUpUseCase = signUpUseCase;

  Future<void> signup() {
    return _signUpUseCase.signup(email, password).then((value) {
      if (value.user != null) {
        _signUpUseCase.sendEmailVerification(value.user!);
      }
    });
  }
}
