import 'package:flutter/material.dart';

class ChatRoomPage extends StatelessWidget {
  final String chatID;

  const ChatRoomPage(this.chatID, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('채팅'),
      ),
    );
  }
}
