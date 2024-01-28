import 'package:chat_application/src/core/constants/firestore_database_constants.dart';
import 'package:chat_application/src/features/chats/domain/model/user_info.dart';

extension MapExtension on Map {
  UserInfo toUserInfo(String uid) {
    return UserInfo(
      name: this[UserFieldKey.name] ?? '',
      uid: uid,
    );
  }
}
