import 'package:chat_application/src/features/chats/domain/model/chat_info.dart';
import 'package:chat_application/src/features/chats/presentation/presenter/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatListView extends ConsumerWidget {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<ChatInfo> chats = ref.watch(chatsProvider);

    return ListView.builder(
      itemBuilder: (context, index) => _ChatItem(chatInfo: chats[index]),
      itemCount: chats.length,
    );
  }
}

class _ChatItem extends StatelessWidget {
  final ChatInfo chatInfo;

  const _ChatItem({
    super.key,
    required this.chatInfo,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(chatInfo.name),
    );
  }
}
