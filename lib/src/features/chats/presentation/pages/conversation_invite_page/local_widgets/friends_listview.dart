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
        isChecked: false,
      ),
      itemCount: invitedInfoState.friends.length,
    );
  }
}

class _FriendItem extends StatelessWidget {
  final UserInfo userInfo;
  final bool isChecked;

  const _FriendItem({
    super.key,
    required this.userInfo,
    required this.isChecked,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.account_circle),
      title: Text(userInfo.name),
      trailing: Checkbox(
        value: isChecked,
        onChanged: (value) {},
      ),
    );
  }
}
