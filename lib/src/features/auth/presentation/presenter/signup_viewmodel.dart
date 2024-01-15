import 'package:chat_application/src/features/auth/domain/usecase/firebae_auth_usecase.dart';

class SignupViewModel {
  final SignUpUseCase _signUpUseCase;
  final UserUseCase _userUseCase;

  String email = '';
  String password = '';
  String name = '';

  SignupViewModel({
    required SignUpUseCase signUpUseCase,
    required UserUseCase userUseCase,
  })  : _signUpUseCase = signUpUseCase,
        _userUseCase = userUseCase;

  Future<void> signup() {
    return _signUpUseCase.signup(email, password).then((value) async {
      if (value.user != null) {
        await _userUseCase.changeName(value.user!, name);
        await _signUpUseCase.sendEmailVerification(value.user!);
      }
    });
  }
}
