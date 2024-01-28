import 'package:chat_application/src/features/friends/data/repository/friends_store_repository_impl.dart';
import 'package:chat_application/src/features/friends/data/repository/users_store_repository_impl.dart';
import 'package:chat_application/src/features/friends/domain/repository/friends_store_repository.dart';
import 'package:chat_application/src/features/friends/domain/repository/users_store_repository.dart';
import 'package:chat_application/src/features/friends/domain/usecase/friends_store_usecase.dart';
import 'package:chat_application/src/features/friends/domain/usecase/users_store_usecase.dart';
import 'package:chat_application/src/features/friends/presentation/presenter/friends_viewmodel.dart';
import 'package:chat_application/src/features/friends/presentation/presenter/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void initializeDependencyInjection() {
  /* Start Initialize Repository */

  UsersStoreRepository usersStoreRepository = UsersStoreRepositoryImpl();

  FriendsStoreRepository friendsStoreRepository = FriendsStoreRepositoryImpl();

  /* End Initialize Repository */

  /* Start Initialize UseCase */

  UsersStoreUseCsae usersStoreUseCsae = UsersStoreUseCsae(
    usersStoreRepository: usersStoreRepository,
  );

  FriendsStoreUseCase friendsStoreUseCase = FriendsStoreUseCase(
    friendsStoreRepository: friendsStoreRepository,
  );

  /* End Initialize UseCase */

  /* Start Initialize ViewModel */

  friendsProvider = Provider(
    (ref) => FriendsViewModel(
      usersStoreUseCsae: usersStoreUseCsae,
      friendsStoreUseCase: friendsStoreUseCase,
    ),
  );

  /* End Initialize ViewModel */
}
