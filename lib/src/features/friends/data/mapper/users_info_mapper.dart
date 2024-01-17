import 'package:chat_application/src/features/friends/domain/model/user_info.dart';

extension MapExtension on Map {
  UserInfo toModel() {
    return UserInfo(onelineInfo: this['oneline']);
  }
}
