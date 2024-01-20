import 'package:chat_application/src/features/chats/domain/model/user_info.dart';
import 'package:chat_application/src/features/chats/presentation/presenter/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OkayButton extends ConsumerWidget {
  const OkayButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<UserInfo> selectedFriends =
        ref.watch(conversationInviteProvider).selectedFriends;
    return TextButton(
      onPressed: selectedFriends.isNotEmpty
          ? () {
              ref.read(conversationInviteProvider.notifier).createChat();
            }
          : null,
      child: const Text('확인'),
    );
  }
}
