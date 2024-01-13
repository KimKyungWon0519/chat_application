import 'package:chat_application/src/features/signin/domain/repository/firebase_auth_repository.dart';

class FirebaseAuthUseCase {
  final FirebaseAuthRepository _firebaseAuthRepository;

  const FirebaseAuthUseCase({
    required FirebaseAuthRepository firebaseAuthRepository,
  }) : _firebaseAuthRepository = firebaseAuthRepository;
}
