import 'package:chat_application/src/features/chat/domain/model/message.dart';

extension MapExtension on Map {
  Message toMessage() {
    return Message(
      uid: this['uid'],
      commnet: this['comment'],
      time: this['time'],
    );
  }
}
