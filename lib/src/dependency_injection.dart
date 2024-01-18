import 'package:chat_application/src/features/auth/data/repository/firebaes_auth_repository_impl.dart';
import 'package:chat_application/src/features/auth/data/repository/users_store_repository_impl.dart'
    as Auth;
import 'package:chat_application/src/features/auth/domain/repository/firebase_auth_repository.dart';
import 'package:chat_application/src/features/auth/domain/repository/users_store_repository.dart'
    as Auth;
import 'package:chat_application/src/features/auth/domain/usecase/firebae_auth_usecase.dart';
import 'package:chat_application/src/features/auth/domain/usecase/users_store_usecase.dart';
import 'package:chat_application/src/features/auth/presentation/presenter/providers.dart';
import 'package:chat_application/src/features/auth/presentation/presenter/signin_viewmodel.dart';
import 'package:chat_application/src/features/auth/presentation/presenter/signup_viewmodel.dart';
import 'package:chat_application/src/features/friends/data/repository/friends_store_repository_impl.dart';
import 'package:chat_application/src/features/friends/data/repository/users_store_repository_impl.dart';
import 'package:chat_application/src/features/friends/domain/repository/friends_store_repository.dart';
import 'package:chat_application/src/features/friends/domain/repository/users_store_repository.dart';
import 'package:chat_application/src/features/friends/domain/usecase/friends_store_usecase.dart';
import 'package:chat_application/src/features/friends/domain/usecase/users_store_usecase.dart';
import 'package:chat_application/src/features/friends/presentation/presenter/friends_viewmodel.dart';
import 'package:chat_application/src/features/friends/presentation/presenter/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void initialize() {
  /* Start initialize Repository */

  FirebaseAuthRepository firebaseAuthRepository = FirebaseAuthRepositoryImpl();
  UsersStoreRepository usersStoreRepository = UsersStoreRepositoryImpl();
  FriendsStoreRepository friendsStoreRepository = FriendsStoreRepositoryImpl();
  Auth.UsersStoreRepository usersStoreRepositoryAuth =
      Auth.UsersStoreRepositoryImpl();

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

  UsersStoreUseCsae usersStoreUseCsae = UsersStoreUseCsae(
    usersStoreRepository: usersStoreRepository,
  );

  FriendsStoreUseCase friendsStoreUseCase = FriendsStoreUseCase(
    friendsStoreRepository: friendsStoreRepository,
  );

  CreateUserInfoUseCase createUserInfoUseCase = CreateUserInfoUseCase(
    usersStoreRepository: usersStoreRepositoryAuth,
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
      createUserInfoUseCase: createUserInfoUseCase,
    ),
  );

  friendsProvider = Provider(
    (ref) => FriendsViewModel(
      usersStoreUseCsae: usersStoreUseCsae,
      friendsStoreUseCase: friendsStoreUseCase,
    ),
  );

  /* End initialize Provider */
}
