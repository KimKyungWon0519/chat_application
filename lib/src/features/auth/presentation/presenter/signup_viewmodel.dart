import 'package:chat_application/src/features/auth/domain/usecase/firebae_auth_usecase.dart';

class SignupViewModel {
  final FirebaseAuthUseCase _firebaseAuthUseCase;

  String email = '';
  String password = '';
  String name = '';

  SignupViewModel({
    required FirebaseAuthUseCase firebaseAuthUseCase,
  }) : _firebaseAuthUseCase = firebaseAuthUseCase;
}
