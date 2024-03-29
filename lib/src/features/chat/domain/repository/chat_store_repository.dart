abstract class ChatStoreRepository {
  Future<String> getChatName(String chatID);
  Stream<List<String>> getTalkersSnapshot(String chatID);
}
