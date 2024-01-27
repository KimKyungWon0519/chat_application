import 'package:chat_application/src/features/chat/data/data_source/worldtime_client.dart';
import 'package:chat_application/src/features/chat/data/repository/chat_store_repository_impl.dart';
import 'package:chat_application/src/features/chat/data/repository/chats_realtime_db_repository_impl.dart';
import 'package:chat_application/src/features/chat/data/repository/user_store_repository_impl.dart';
import 'package:chat_application/src/features/chat/data/repository/worldtime_repository_impl.dart';
import 'package:chat_application/src/features/chat/domain/repository/chat_store_repository.dart';
import 'package:chat_application/src/features/chat/domain/repository/chats_realtime_db_repository.dart';
import 'package:chat_application/src/features/chat/domain/repository/user_store_repository.dart';
import 'package:chat_application/src/features/chat/domain/repository/worldtime_repository.dart';
import 'package:chat_application/src/features/chat/domain/usecase/chat_store_usecase.dart';
import 'package:chat_application/src/features/chat/domain/usecase/chats_realtime_db_usecase.dart';
import 'package:chat_application/src/features/chat/domain/usecase/user_store_usecase.dart';
import 'package:chat_application/src/features/chat/domain/usecase/worldtime_usecase.dart';
import 'package:chat_application/src/features/chat/presentation/presenter/chat_viewmodel.dart';
import 'package:chat_application/src/features/chat/presentation/presenter/providers.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void initializeDependencyInjection() {
  /* Start Initialize Client */

  WorldTimeClient worldTimeClient = WorldTimeClient(dio: Dio());

  /* End Initialize Client */

  /* Start Initialize Repository */

  ChatStoreRepository chatStoreRepository = ChatStoreRepositoryImpl();

  UserStoreRepository userStoreRepository = UserStoreRepositoryImpl();

  WorldTimeRepository worldTimeRepository =
      WorldTimeRepositoryImpl(worldTimeClient: worldTimeClient);

  ChatsRealTimeDBRepository chatsRealTimeDBRepository =
      ChatsRealTimeDBRepositoryImpl();

  /* End Initialize Repository */

  /* Start Initialize UseCase */

  GetChatDataUseCase getChatDataUseCase = GetChatDataUseCase(
    chatStoreRepository: chatStoreRepository,
  );

  GetUserDataUseCase getUserDataUseCase = GetUserDataUseCase(
    userStoreRepository: userStoreRepository,
  );

  GetWorldTimeUseCase getWorldTimeUseCase = GetWorldTimeUseCase(
    worldTimeRepository: worldTimeRepository,
  );

  GetRealTimeChat getRealTimeChat = GetRealTimeChat(
    chatsRealTimeDBRepository: chatsRealTimeDBRepository,
  );

  SetRealTimeChat setRealTimeChat = SetRealTimeChat(
    chatsRealTimeDBRepository: chatsRealTimeDBRepository,
  );

  /* End Initialize UseCase */

  /* Start Initialize ViewModel */

  chatProvider = Provider.autoDispose(
    (ref) {
      ChatViewModel chatViewModel = ChatViewModel(
        getChatDataUseCase: getChatDataUseCase,
        getUserDataUseCase: getUserDataUseCase,
        getWorldTimeUseCase: getWorldTimeUseCase,
        getRealTimeChat: getRealTimeChat,
        setRealTimeChat: setRealTimeChat,
      );

      ref.onDispose(() {
        chatViewModel.scrollController.dispose();
      });

      return chatViewModel;
    },
  );

  /* End Initialize ViewModel */
}
