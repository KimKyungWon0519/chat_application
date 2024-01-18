import 'package:chat_application/src/features/auth/domain/usecase/firebae_auth_usecase.dart';
import 'package:chat_application/src/features/auth/domain/usecase/users_store_usecase.dart';

class SignupViewModel {
  final SignUpUseCase _signUpUseCase;
  final UserUseCase _userUseCase;
  final AuthUseCase _authUseCase;
  final CreateUserInfoUseCase _createUserInfoUseCase;

  String email = '';
  String password = '';
  String name = '';

  SignupViewModel({
    required SignUpUseCase signUpUseCase,
    required UserUseCase userUseCase,
    required AuthUseCase authUseCase,
    required CreateUserInfoUseCase createUserInfoUseCase,
  })  : _signUpUseCase = signUpUseCase,
        _userUseCase = userUseCase,
        _authUseCase = authUseCase,
        _createUserInfoUseCase = createUserInfoUseCase;

  Future<void> signup() {
    return _signUpUseCase.signup(email, password).then((value) async {
      if (value.user != null) {
        await _userUseCase.changeName(value.user!, name);
        await _signUpUseCase.sendEmailVerification(value.user!);
        await _createUserInfoUseCase.createUserInfo(value.user!.uid, name);
        _authUseCase.signout();
      }
    });
  }
}
