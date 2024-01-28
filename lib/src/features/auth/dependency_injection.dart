import 'package:chat_application/src/features/auth/data/repository/firebaes_auth_repository_impl.dart';
import 'package:chat_application/src/features/auth/domain/repository/firebase_auth_repository.dart';
import 'package:chat_application/src/features/auth/domain/usecase/firebae_auth_usecase.dart';
import 'package:chat_application/src/features/auth/domain/usecase/users_store_usecase.dart';
import 'package:chat_application/src/features/auth/presentation/presenter/providers.dart';
import 'package:chat_application/src/features/auth/presentation/presenter/signin_viewmodel.dart';
import 'package:chat_application/src/features/auth/presentation/presenter/signup_viewmodel.dart';
import 'package:chat_application/src/features/auth/domain/repository/users_store_repository.dart';
import 'package:chat_application/src/features/auth/data/repository/users_store_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void initializeDependencyInjection() {
  /* Start Initialize Repository */

  FirebaseAuthRepository firebaseAuthRepository = FirebaseAuthRepositoryImpl();

  UsersStoreRepository usersStoreRepository = UsersStoreRepositoryImpl();

  /* End Initialize Repository */

  /* Start Initialize UseCase */

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

  CreateUserInfoUseCase createUserInfoUseCase = CreateUserInfoUseCase(
    usersStoreRepository: usersStoreRepository,
  );

  /* End Initialize UseCase */

  /* Start Initialize ViewModel */

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
      createUserInfoUseCase: createUserInfoUseCase,
    ),
  );

  /* End Initialize ViewModel */
}
