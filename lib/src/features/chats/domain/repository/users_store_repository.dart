import 'package:chat_application/src/features/chats/domain/model/user_info.dart';

abstract class UsersStoreRepository {
  Future<UserInfo> getUserInfo(String uid);
}
