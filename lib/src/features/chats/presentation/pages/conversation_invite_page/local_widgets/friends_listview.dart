import 'package:chat_application/src/features/chats/domain/model/user_info.dart';
import 'package:chat_application/src/features/chats/presentation/presenter/conversation_invite_viewmodel.dart';
import 'package:chat_application/src/features/chats/presentation/presenter/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FriendsListView extends ConsumerWidget {
  const FriendsListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    InvitedInfoState invitedInfoState = ref.watch(conversationInviteProvider);

    return ListView.builder(
      itemBuilder: (context, index) => _FriendItem(
        userInfo: invitedInfoState.friends[index],
      ),
      itemCount: invitedInfoState.friends.length,
    );
  }
}

class _FriendItem extends ConsumerWidget {
  final UserInfo userInfo;

  const _FriendItem({
    super.key,
    required this.userInfo,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ConversationInviteViewModel conversationInviteViewModel =
        ref.read(conversationInviteProvider.notifier);

    return ListTile(
      leading: const Icon(Icons.account_circle),
      title: Text(userInfo.name),
      trailing: Checkbox(
        value: conversationInviteViewModel.isSelected(userInfo),
        onChanged: (value) {
          if (value == null) return;

          if (value) {
            conversationInviteViewModel.selectedFriend(userInfo);
          } else {
            conversationInviteViewModel.unselectedFriend(userInfo);
          }
        },
      ),
    );
  }
}
