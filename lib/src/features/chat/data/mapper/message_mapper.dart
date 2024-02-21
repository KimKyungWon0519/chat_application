import 'package:chat_application/src/features/chat/domain/model/message.dart';

extension MapExtension on Map {
  Message toMessage(String dateTime) {
    return Message(
      uid: this['uid'],
      comment: this['comment'],
      dateTime: dateTime,
    );
  }
}

extension MessageExtension on Message {
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'comment': comment,
    };
  }
}
