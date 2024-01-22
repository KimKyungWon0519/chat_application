import 'package:chat_application/src/core/constants/cloud_firestore_path.dart';
import 'package:chat_application/src/features/chats/domain/model/chat_info.dart';

extension MapExtension on Map {
  ChatInfo toChatInfo(String id) {
    return ChatInfo(
      id: id,
      name: this[ChatFieldKey.name] ?? '',
    );
  }
}
