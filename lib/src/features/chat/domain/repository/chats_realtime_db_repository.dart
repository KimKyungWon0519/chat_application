import 'package:chat_application/src/features/chat/domain/model/chat.dart';

abstract class ChatsRealTimeDBRepository {
  void sendChat(
    String chatID, {
    required String comment,
    required DateTime dateTime,
  });

  Stream<List<ChatData>> getChats(String chatID);
}
