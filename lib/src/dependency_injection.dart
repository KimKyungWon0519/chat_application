import 'package:chat_application/src/features/signin/data/repository/firebaes_auth_repository_impl.dart';
import 'package:chat_application/src/features/signin/domain/repository/firebase_auth_repository.dart';
import 'package:chat_application/src/features/signin/domain/usecase/firebae_auth_usecase.dart';
import 'package:chat_application/src/features/signin/presentation/presenter/providers.dart';
import 'package:chat_application/src/features/signin/presentation/presenter/signin_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void initialize() {
  /* Start initialize Repository */

  FirebaseAuthRepository firebaseAuthRepository = FirebaseAuthRepositoryImpl();

  /* End initialize Repository */

  /* Start initialize Usecase */

  FirebaseAuthUseCase firebaseAuthUseCase = FirebaseAuthUseCase(
    firebaseAuthRepository: firebaseAuthRepository,
  );

  /* End initialize Usecase */

  /* Start initialize Provider */

  signinProvider = Provider(
    (ref) => SigninViewModel(
      firebaseAuthUseCase: firebaseAuthUseCase,
    ),
  );

  /* End initialize Provider */
}
