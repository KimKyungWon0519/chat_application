import 'package:chat_application/src/features/chats/data/repository/friends_store_repository_impl.dart';
import 'package:chat_application/src/features/chats/domain/repository/friends_store_repository.dart';
import 'package:chat_application/src/features/chats/domain/repository/users_store_repository.dart';
import 'package:chat_application/src/features/chats/domain/usecase/friends_usecase.dart';
import 'package:chat_application/src/features/chats/domain/usecase/users_usecase.dart';
import 'package:chat_application/src/features/chats/presentation/presenter/conversation_invite_viewmodel.dart';
import 'package:chat_application/src/features/chats/presentation/presenter/providers.dart';
import 'package:chat_application/src/features/chats/data/repository/users_store_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void intializeDependencyInjection() {
  /* Start Initialize Repository */

  FriendsStoreRepository friendsStoreRepository = FriendsStoreRepositoryImpl();
  UsersStoreRepository usersStoreRepository = UsersStoreRepositoryImpl();

  /* End Initialize Repository */

  /* Start Initialize UseCase */

  GetFriendsUseCase getFriendsUseCase = GetFriendsUseCase(
    friendsStoreRepository: friendsStoreRepository,
  );

  GetUserInfoUseCase getUserInfoUseCase = GetUserInfoUseCase(
    usersStoreRepository: usersStoreRepository,
  );

  /* End Initialize UseCase */

  /* Start Intialize ViewModel */

  conversationInviteProvider = AutoDisposeStateNotifierProvider(
    (ref) => ConversationInviteViewModel(
      getFriendsUseCase: getFriendsUseCase,
      getUserInfoUseCase: getUserInfoUseCase,
    ),
  );

  /* End Intialize ViewModel */
}
