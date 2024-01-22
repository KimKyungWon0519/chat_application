import 'package:chat_application/src/features/chats/domain/model/user_info.dart';
import 'package:chat_application/src/features/chats/presentation/presenter/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedFriendsExpansionTile extends ConsumerWidget {
  const SelectedFriendsExpansionTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<UserInfo> selectedFriends =
        ref.watch(conversationInviteProvider).selectedFriends;

    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: Text('선택된 친구 : ${selectedFriends.length}명'),
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 3,
            child: ListView.builder(
              itemBuilder: (context, index) => ListTile(
                title: Text(selectedFriends[index].name),
              ),
              itemCount: selectedFriends.length,
            ),
          ),
        ],
      ),
    );
  }
}
