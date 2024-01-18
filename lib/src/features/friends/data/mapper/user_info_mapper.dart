import 'package:chat_application/src/features/friends/domain/model/user_info.dart';

extension MapExtenstion on Map {
  UserInfo toUserInfo(String uid) {
    return UserInfo(
      uid: uid,
      name: this['name'] ?? '',
      onelineInfo: this['oneline_info'] ?? '',
      code: this['code'] ?? '',
    );
  }
}
