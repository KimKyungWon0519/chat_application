import 'package:chat_application/src/features/friend_management/domain/model/user_info.dart';

abstract class FriendsStoreRepository {
  Future<UserInfo> getAllFriends(String uid);
}
