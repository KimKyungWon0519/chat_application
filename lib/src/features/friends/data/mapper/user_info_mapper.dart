import 'package:chat_application/src/core/constants/firestore_database_constants.dart';
import 'package:chat_application/src/features/friends/domain/model/user_info.dart';

extension MapExtenstion on Map {
  UserInfo toUserInfo(String uid) {
    return UserInfo(
      uid: uid,
      name: this[UserFieldKey.name] ?? '',
      onelineInfo: this[UserFieldKey.onelineInfo] ?? '',
      code: this[UserFieldKey.code] ?? '',
    );
  }
}
