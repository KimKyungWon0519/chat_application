import 'package:chat_application/src/features/auth/domain/usecase/firebae_auth_usecase.dart';

class AccountManagementViewModel {
  final AuthUseCase _authUseCase;

  AccountManagementViewModel({
    required AuthUseCase authUseCase,
  }) : _authUseCase = authUseCase;

  Future<void> signout() {
    return _authUseCase.signout();
  }
}
