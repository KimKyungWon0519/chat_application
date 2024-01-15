import 'package:chat_application/src/features/auth/data/repository/firebaes_auth_repository_impl.dart';
import 'package:chat_application/src/features/auth/domain/repository/firebase_auth_repository.dart';
import 'package:chat_application/src/features/auth/domain/usecase/firebae_auth_usecase.dart';
import 'package:chat_application/src/features/auth/presentation/presenter/providers.dart';
import 'package:chat_application/src/features/auth/presentation/presenter/signin_viewmodel.dart';
import 'package:chat_application/src/features/auth/presentation/presenter/signup_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void initialize() {
  /* Start initialize Repository */

  FirebaseAuthRepository firebaseAuthRepository = FirebaseAuthRepositoryImpl();

  /* End initialize Repository */

  /* Start initialize Usecase */

  SigninUseCase signinUseCase = SigninUseCase(
    firebaseAuthRepository: firebaseAuthRepository,
  );

  SignUpUseCase signUpUseCase = SignUpUseCase(
    firebaseAuthRepository: firebaseAuthRepository,
  );

  UserUseCase userUseCase = UserUseCase(
    firebaseAuthRepository: firebaseAuthRepository,
  );

  AuthUseCase authUseCase = AuthUseCase(
    firebaseAuthRepository: firebaseAuthRepository,
  );

  /* End initialize Usecase */

  /* Start initialize Provider */

  signinProvider = Provider(
    (ref) => SigninViewModel(
      signinUseCase: signinUseCase,
    ),
  );

  signupProvider = Provider(
    (ref) => SignupViewModel(
      signUpUseCase: signUpUseCase,
      userUseCase: userUseCase,
      authUseCase: authUseCase,
    ),
  );

  /* End initialize Provider */
}
