import 'package:chat_application/src/core/constants/firestore_database_constants.dart';
import 'package:chat_application/src/features/chats/domain/model/chat_info.dart';

extension MapExtension on Map {
  ChatInfo toChatInfo(String id) {
    return ChatInfo(
      id: id,
      name: this[ChatFieldKey.name] ?? '',
      uids: (this[ChatFieldKey.uids] as List ?? [])
          .map((e) => e as String)
          .toList(),
    );
  }
}
