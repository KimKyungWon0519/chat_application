import 'package:chat_application/src/features/chat/domain/usecase/chat_store_usecase.dart';
import 'package:chat_application/src/features/chat/domain/usecase/user_store_usecase.dart';

class ChatViewModel {
  final GetChatDataUseCase _getChatDataUseCase;
  final GetUserDataUseCase _getUserDataUseCase;

  ChatViewModel({
    required GetChatDataUseCase getChatDataUseCase,
    required GetUserDataUseCase getUserDataUseCase,
  })  : _getChatDataUseCase = getChatDataUseCase,
        _getUserDataUseCase = getUserDataUseCase;

  Future<String> getChatName(String chatID) {
    return _getChatDataUseCase.getChatName(chatID);
  }

  Stream<List<String>> getTalkerUIDSnapshot(String chatID) {
    return _getChatDataUseCase.getTalkersSnapshot(chatID);
  }

  Stream<String> getUserNameSnapshot(String uid) {
    return _getUserDataUseCase.getuserNameSnapshot(uid);
  }
}
