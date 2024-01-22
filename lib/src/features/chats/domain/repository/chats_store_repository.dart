import 'package:chat_application/src/features/chats/domain/model/user_info.dart';

abstract class ChatsStoreRepository {
  Future<String> createChat(List<UserInfo> users, String? name);
  Future<String?> getChatID(List<UserInfo> users);
}
