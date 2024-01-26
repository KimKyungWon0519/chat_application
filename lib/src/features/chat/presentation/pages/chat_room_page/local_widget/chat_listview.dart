import 'package:chat_application/src/features/chat/domain/model/chat.dart';
import 'package:chat_application/src/features/chat/domain/model/message.dart';
import 'package:chat_application/src/features/chat/presentation/presenter/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatListView extends ConsumerWidget {
  final String chatID;

  const ChatListView({
    super.key,
    required this.chatID,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
      stream: ref.read(chatProvider).getChats(chatID),
      builder: (context, snapshot) {
        List<ChatData> datas = snapshot.data ?? [];

        return SingleChildScrollView(
          child: Column(
            children: [
              for (ChatData data in datas)
                Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(child: Divider()),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(data.date),
                        ),
                        const Expanded(child: Divider()),
                      ],
                    ),
                    for (Message message in data.message)
                      _ChatItem(message: message),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }
}

class _ChatItem extends ConsumerWidget {
  final Message message;

  const _ChatItem({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
      stream: ref.read(chatProvider).getUserNameSnapshot(message.uid),
      builder: (context, snapshot) {
        bool isMine = ref.read(chatProvider).isMyUid(message.uid);

        String data = snapshot.data ?? '';

        return Align(
          alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment:
                  isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Text(data),
                _ChatBubble(
                  message: message,
                  isMine: isMine,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ChatBubble extends StatelessWidget {
  final Message message;
  final bool isMine;

  const _ChatBubble({
    super.key,
    required this.message,
    required this.isMine,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              message.commnet,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
      ]..insert(
          isMine ? 0 : 1,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(message.time.substring(0, '00:00'.length)),
          ),
        ),
    );
  }
}
