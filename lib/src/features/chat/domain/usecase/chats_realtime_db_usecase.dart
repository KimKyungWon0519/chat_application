import 'package:chat_application/src/features/chat/domain/model/chat.dart';
import 'package:chat_application/src/features/chat/domain/model/message.dart';
import 'package:chat_application/src/features/chat/domain/repository/chats_realtime_db_repository.dart';

class GetRealTimeChat {
  final ChatsRealTimeDBRepository _chatsRealTimeDBRepository;

  GetRealTimeChat({
    required ChatsRealTimeDBRepository chatsRealTimeDBRepository,
  }) : _chatsRealTimeDBRepository = chatsRealTimeDBRepository;

  Stream<List<ChatData>> getChats(String chatID) {
    return _chatsRealTimeDBRepository.getChats(chatID);
  }
}

class SetRealTimeChat {
  final ChatsRealTimeDBRepository _chatsRealTimeDBRepository;

  SetRealTimeChat({
    required ChatsRealTimeDBRepository chatsRealTimeDBRepository,
  }) : _chatsRealTimeDBRepository = chatsRealTimeDBRepository;

  void sendMessage(
    String chatID, {
    required String comment,
    required DateTime dateTime,
  }) {
    _chatsRealTimeDBRepository.sendChat(chatID,
        comment: comment, dateTime: dateTime);
  }

  void deleteMessage(String chatID, Message message) {
    _chatsRealTimeDBRepository.deleteChat(chatID, message);
  }
}
