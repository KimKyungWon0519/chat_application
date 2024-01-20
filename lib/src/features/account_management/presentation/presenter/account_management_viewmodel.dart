import 'package:chat_application/src/features/account_management/domain/usecase/auth_usecase.dart';

class AccountManagementViewModel {
  final AuthUseCase _authUseCase;

  AccountManagementViewModel({
    required AuthUseCase authUseCase,
  }) : _authUseCase = authUseCase;

  Future<void> signout() {
    return _authUseCase.signout();
  }
}
