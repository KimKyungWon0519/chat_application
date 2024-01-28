import 'package:chat_application/src/features/chat/domain/repository/chat_store_repository.dart';

class GetChatDataUseCase {
  final ChatStoreRepository _chatStoreRepository;

  GetChatDataUseCase({
    required ChatStoreRepository chatStoreRepository,
  }) : _chatStoreRepository = chatStoreRepository;

  Future<String> getChatName(String chatID) {
    return _chatStoreRepository.getChatName(chatID);
  }

  Stream<List<String>> getTalkersSnapshot(String chatID) {
    return _chatStoreRepository.getTalkersSnapshot(chatID);
  }
}
