import 'package:chat_application/src/features/chat/data/mapper/message_mapper.dart';
import 'package:chat_application/src/features/chat/domain/model/chat.dart';

extension MapExtension on Map {
  ChatData toChatData() {
    return ChatData(
      date: this['date'] as String,
      message: (this['date'] as List<Map>).map((e) => e.toMessage()).toList(),
    );
  }
}
