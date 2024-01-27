import 'package:chat_application/src/features/chat/data/mapper/message_mapper.dart';
import 'package:chat_application/src/features/chat/domain/model/chat.dart';

extension MapEntryExtenstion on MapEntry {
  ChatData toChatData() {
    List<MapEntry> messages = (value as Map).entries.toList();
    messages.sort(
      (a, b) => (a.key as String).compareTo(b.key as String),
    );

    return ChatData(
        date: key as String,
        message: messages.map((e) => (e.value as Map).toMessage()).toList());
  }
}
