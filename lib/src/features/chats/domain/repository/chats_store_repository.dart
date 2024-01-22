import 'package:chat_application/src/features/chats/domain/model/user_info.dart';

abstract class ChatsStoreRepository {
  Future<String> createChat(List<UserInfo> users);
  Future<String?> getChatID(List<UserInfo> users);
}
