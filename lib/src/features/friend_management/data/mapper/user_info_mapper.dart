import 'package:chat_application/src/features/friend_management/domain/model/user_info.dart';

extension MapExtension on Map {
  UserInfo toUserInfo() {
    return UserInfo(
      uid: this['uid'] ?? '',
      name: this['name'] ?? '',
    );
  }
}
