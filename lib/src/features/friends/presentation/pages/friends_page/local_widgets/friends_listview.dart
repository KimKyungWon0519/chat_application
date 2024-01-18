import 'package:chat_application/src/features/friends/domain/model/user_info.dart';
import 'package:chat_application/src/features/friends/presentation/presenter/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'user_tile.dart';

class FriendsListView extends ConsumerWidget {
  const FriendsListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<List>(
      stream: ref.read(friendsProvider).getFrirendsSnaphot(),
      builder: (context, snapshot) {
        List data = snapshot.data ?? [];

        return Column(
          children: [
            for (int i = 0; i < data.length; i++) _FriendItem(uid: data[i]),
          ],
        );
      },
    );
  }
}

class _FriendItem extends ConsumerWidget {
  final String uid;

  const _FriendItem({
    super.key,
    required this.uid,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<UserInfo>(
      stream: ref.read(friendsProvider).getUserSnapshot(uid),
      builder: (context, snapshot) {
        UserInfo user = snapshot.data ?? const UserInfo.empty();

        return UserTile(
          userInfo: user,
        );
      },
    );
  }
}
