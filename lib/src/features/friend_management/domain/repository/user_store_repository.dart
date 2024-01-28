import 'package:chat_application/src/features/friend_management/domain/model/user_info.dart';

abstract class UsersStoreRepository {
  Future<String> getMyCode();
  Future<UserInfo?> getUserWithCode(String code);
}
