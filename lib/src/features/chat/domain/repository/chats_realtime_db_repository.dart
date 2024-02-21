import 'package:chat_application/src/features/chat/domain/model/chat.dart';
import 'package:chat_application/src/features/chat/domain/model/message.dart';

abstract class ChatsRealTimeDBRepository {
  void sendChat(
    String chatID, {
    required String comment,
    required DateTime dateTime,
  });

  Stream<List<ChatData>> getChats(String chatID);

  void deleteChat(String chatID, Message message);
}
