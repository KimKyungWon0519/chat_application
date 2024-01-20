import 'package:chat_application/src/core/constants/cloud_firestore_path.dart';
import 'package:chat_application/src/features/friend_management/domain/model/user_info.dart';

extension MapExtension on Map {
  UserInfo toUserInfo(String uid) {
    return UserInfo(
      uid: uid,
      name: this[UserFieldKey.name] ?? '',
    );
  }
}
