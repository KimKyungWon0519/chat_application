import 'package:chat_application/src/features/friend_management/domain/model/user_info.dart';
import 'package:chat_application/src/features/friend_management/presentation/presenter/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FriendCard extends ConsumerWidget {
  const FriendCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserInfo? user = ref.watch(addFriendProvider);

    if (user == null) return Container();

    return Card(
      margin: EdgeInsets.zero,
      child: ListTile(
        title: Text(user.name),
        trailing: TextButton(
          child: const Text('추가'),
          onPressed: () {
            ref.read(addFriendProvider.notifier).addFriend(user.uid);
          },
        ),
      ),
    );
  }
}
