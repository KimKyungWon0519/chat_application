import 'package:chat_application/src/features/chat/presentation/presenter/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatNameText extends ConsumerWidget {
  final String chatID;

  const ChatNameText(this.chatID, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: ref.read(chatProvider).getChatName(chatID),
      builder: (context, snapshot) {
        return Text(snapshot.data ?? '');
      },
    );
  }
}
