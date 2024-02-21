import 'package:chat_application/src/features/chat/domain/model/chat.dart';
import 'package:chat_application/src/features/chat/domain/model/message.dart';
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

  String chatID = '';

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

  void senMessage(String chatID, String comment) async {
    DateTime dateTime = await _getWorldTimeUseCase.getRealTime();

    _setRealTimeChat.sendMessage(
      chatID,
      comment: comment,
      dateTime: dateTime,
    );
  }

  Stream<List<ChatData>> getChats(String chatID) {
    return _getRealTimeChat.getChats(chatID);
  }

  bool isMyUid(String uid) {
    return _getUserDataUseCase.isMyUid(uid);
  }

  void deleteMessage(Message message) {
    _setRealTimeChat.deleteMessage(chatID, message);
  }
}
