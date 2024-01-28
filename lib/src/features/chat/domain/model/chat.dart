import 'package:chat_application/src/features/chat/domain/model/message.dart';

class ChatData {
  final String date;
  final List<Message> message;

  const ChatData({
    required this.date,
    required this.message,
  });
}
