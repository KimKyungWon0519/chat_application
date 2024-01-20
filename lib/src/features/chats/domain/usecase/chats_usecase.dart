import 'package:chat_application/src/features/chats/domain/repository/chats_store_repository.dart';

class AddChatUseCase {
  final ChatsStoreRepository _chatsStoreRepository;

  AddChatUseCase({
    required ChatsStoreRepository chatsStoreRepository,
  }) : _chatsStoreRepository = chatsStoreRepository;
}
