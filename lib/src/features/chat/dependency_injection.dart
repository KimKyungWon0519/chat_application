import 'package:chat_application/src/features/chat/data/repository/chat_store_repository_impl.dart';
import 'package:chat_application/src/features/chat/data/repository/user_store_repository_impl.dart';
import 'package:chat_application/src/features/chat/domain/repository/chat_store_repository.dart';
import 'package:chat_application/src/features/chat/domain/repository/user_store_repository.dart';
import 'package:chat_application/src/features/chat/domain/usecase/chat_store_usecase.dart';
import 'package:chat_application/src/features/chat/domain/usecase/user_store_usecase.dart';
import 'package:chat_application/src/features/chat/presentation/presenter/chat_viewmodel.dart';
import 'package:chat_application/src/features/chat/presentation/presenter/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void initializeDependencyInjection() {
  /* Start Initialize Repository */

  ChatStoreRepository chatStoreRepository = ChatStoreRepositoryImpl();

  UserStoreRepository userStoreRepository = UserStoreRepositoryImpl();

  /* End Initialize Repository */

  /* Start Initialize UseCase */

  GetChatDataUseCase getChatDataUseCase = GetChatDataUseCase(
    chatStoreRepository: chatStoreRepository,
  );

  GetUserDataUseCase getUserDataUseCase = GetUserDataUseCase(
    userStoreRepository: userStoreRepository,
  );

  /* End Initialize UseCase */

  /* Start Initialize ViewModel */

  chatProvider = Provider(
    (ref) => ChatViewModel(
      getChatDataUseCase: getChatDataUseCase,
      getUserDataUseCase: getUserDataUseCase,
    ),
  );

  /* End Initialize ViewModel */
}
