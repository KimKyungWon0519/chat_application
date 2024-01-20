import 'package:chat_application/src/features/account_management/domain/repository/auth_repository.dart';

class AuthUseCase {
  final AuthRepository _authRepository;

  AuthUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  Future<void> signout() {
    return _authRepository.signout();
  }
}
