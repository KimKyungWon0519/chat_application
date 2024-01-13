import 'package:chat_application/src/features/signin/domain/usecase/firebae_auth_usecase.dart';

class SigninViewModel {
  final FirebaseAuthUseCase _firebaseAuthUseCase;

  String email = '';
  String password = '';

  SigninViewModel({
    required FirebaseAuthUseCase firebaseAuthUseCase,
  }) : _firebaseAuthUseCase = firebaseAuthUseCase;
}
