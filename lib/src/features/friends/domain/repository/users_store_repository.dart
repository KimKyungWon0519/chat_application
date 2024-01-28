import 'package:chat_application/src/features/friends/domain/model/user_info.dart';

abstract class UsersStoreRepository {
  Stream<UserInfo> getMyUserInfoSnapshot();
  Stream<UserInfo> getUserInfoSnapshot(String uid);
}
