abstract class ChatsRealTimeDBRepository {
  void sendChat(
    String chatID, {
    required String comment,
    required DateTime dateTime,
  });
}
