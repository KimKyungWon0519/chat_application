import 'package:chat_application/src/features/chats/presentation/presenter/conversation_invite_viewmodel.dart';
import 'package:chat_application/src/features/chats/presentation/presenter/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedCount extends ConsumerWidget {
  const SelectedCount({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    InvitedInfoState invitedInfoState = ref.watch(conversationInviteProvider);
    int count = invitedInfoState.selectedFriends.length;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text('선택된 친구 : $count명'),
      ),
    );
  }
}
