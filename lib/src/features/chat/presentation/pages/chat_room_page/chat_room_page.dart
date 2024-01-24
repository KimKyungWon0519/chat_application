import 'package:flutter/material.dart';

import 'local_widget/chat_field.dart';
import 'local_widget/chat_listview.dart';
import 'local_widget/chat_name_text.dart';
import 'local_widget/user_list_drawer.dart';

class ChatRoomPage extends StatelessWidget {
  final String chatID;

  const ChatRoomPage(this.chatID, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ChatNameText(chatID),
      ),
      body: const Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: ChatListView(),
            ),
            ChatField(),
          ],
        ),
      ),
      endDrawer: UserListDrawer(chatID: chatID),
    );
  }
}
