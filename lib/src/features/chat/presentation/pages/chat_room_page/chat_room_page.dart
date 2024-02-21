import 'package:chat_application/src/features/chat/presentation/presenter/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'local_widget/chat_field.dart';
import 'local_widget/chat_listview.dart';
import 'local_widget/chat_name_text.dart';
import 'local_widget/user_list_drawer.dart';

class ChatRoomPage extends ConsumerWidget {
  final String chatID;

  const ChatRoomPage(this.chatID, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(chatProvider).chatID = chatID;

    return Scaffold(
      appBar: AppBar(
        title: const ChatNameText(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Expanded(
              child: ChatListView(),
            ),
            ChatField(chatID),
          ],
        ),
      ),
      endDrawer: const UserListDrawer(),
    );
  }
}
