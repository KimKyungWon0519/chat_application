import 'package:chat_application/src/features/chat/domain/usecase/chat_store_usecase.dart';
import 'package:chat_application/src/features/chat/domain/usecase/chats_realtime_db_usecase.dart';
import 'package:chat_application/src/features/chat/domain/usecase/user_store_usecase.dart';
import 'package:chat_application/src/features/chat/domain/usecase/worldtime_usecase.dart';

class ChatViewModel {
  final GetChatDataUseCase _getChatDataUseCase;
  final GetUserDataUseCase _getUserDataUseCase;
  final GetWorldTimeUseCase _getWorldTimeUseCase;
  final GetRealTimeChat _getRealTimeChat;
  final SetRealTimeChat _setRealTimeChat;

  ChatViewModel({
    required GetChatDataUseCase getChatDataUseCase,
    required GetUserDataUseCase getUserDataUseCase,
    required GetWorldTimeUseCase getWorldTimeUseCase,
    required GetRealTimeChat getRealTimeChat,
    required SetRealTimeChat setRealTimeChat,
  })  : _getChatDataUseCase = getChatDataUseCase,
        _getUserDataUseCase = getUserDataUseCase,
        _getWorldTimeUseCase = getWorldTimeUseCase,
        _getRealTimeChat = getRealTimeChat,
        _setRealTimeChat = setRealTimeChat;

  Future<String> getChatName(String chatID) {
    return _getChatDataUseCase.getChatName(chatID);
  }

  Stream<List<String>> getTalkerUIDSnapshot(String chatID) {
    return _getChatDataUseCase.getTalkersSnapshot(chatID);
  }

  Stream<String> getUserNameSnapshot(String uid) {
    return _getUserDataUseCase.getuserNameSnapshot(uid);
  }

  Future<DateTime> getRealTime() {
    return _getWorldTimeUseCase.getRealTime();
  }
}
