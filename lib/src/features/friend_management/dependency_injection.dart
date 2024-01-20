import 'package:chat_application/src/features/friend_management/data/repository/friends_store_repository_impl.dart';
import 'package:chat_application/src/features/friend_management/data/repository/user_store_repository_impl.dart';
import 'package:chat_application/src/features/friend_management/domain/repository/friends_store_repository.dart';
import 'package:chat_application/src/features/friend_management/domain/repository/user_store_repository.dart';
import 'package:chat_application/src/features/friend_management/domain/usecase/friends_store_usecase.dart';
import 'package:chat_application/src/features/friend_management/domain/usecase/users_store_usecase.dart';
import 'package:chat_application/src/features/friend_management/presentation/presenter/add_friend_viewmodel.dart';
import 'package:chat_application/src/features/friend_management/presentation/presenter/providers.dart';
import 'package:chat_application/src/features/friend_management/domain/model/user_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void initializeDependencyInjection() {
  /* Start Initialize Repository */

  UsersStoreRepository usersStoreRepository = UsersStoreRepositoryImpl();
  FriendsStoreRepository friendsStoreRepository = FriendsStoreRepositoryImpl();

  /* End Initialize Repository */

  /* Start Initialize UseCase */

  UsersStoreUseCase usersStoreUseCase = UsersStoreUseCase(
    usersStoreRepository: usersStoreRepository,
  );

  FriendsStoreUseCase friendsStoreUseCase = FriendsStoreUseCase(
    friendsStoreRepository: friendsStoreRepository,
  );

  /* End Initialize UseCase */

  /* Start Initialize ViewModel */

  addFriendProvider =
      StateNotifierProvider.autoDispose<AddFriendViewModel, UserInfo?>(
    (ref) => AddFriendViewModel(
      usersStoreUseCase: usersStoreUseCase,
      friendsStoreUseCase: friendsStoreUseCase,
    ),
  );

  /* End Initialize ViewModel */
}
