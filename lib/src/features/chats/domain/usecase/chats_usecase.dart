import 'package:chat_application/src/features/chats/domain/repository/chats_store_repository.dart';
import 'package:chat_application/src/features/chats/domain/model/user_info.dart';

class AddChatUseCase {
  final ChatsStoreRepository _chatsStoreRepository;

  AddChatUseCase({
    required ChatsStoreRepository chatsStoreRepository,
  }) : _chatsStoreRepository = chatsStoreRepository;

  Future<String> createChat(List<UserInfo> users) {
    return _chatsStoreRepository.createChat(users);
  }
}
