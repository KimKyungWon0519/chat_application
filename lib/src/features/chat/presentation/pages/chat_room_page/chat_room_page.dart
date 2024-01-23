import 'package:chat_application/src/features/chat/presentation/pages/chat_room_page/lcoal_widget/chat_name_text.dart';
import 'package:chat_application/src/features/chat/presentation/pages/chat_room_page/lcoal_widget/user_list_drawer.dart';
import 'package:flutter/material.dart';

class ChatRoomPage extends StatelessWidget {
  final String chatID;

  const ChatRoomPage(this.chatID, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ChatNameText(chatID),
      ),
      endDrawer: const UserListDrawer(),
    );
  }
}
