import 'package:chat_application/src/features/chat/presentation/presenter/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatNameText extends ConsumerWidget {
  const ChatNameText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String chatID = ref.read(chatProvider).chatID;

    return FutureBuilder(
      future: ref.read(chatProvider).getChatName(chatID),
      builder: (context, snapshot) {
        return Text(snapshot.data ?? '');
      },
    );
  }
}
