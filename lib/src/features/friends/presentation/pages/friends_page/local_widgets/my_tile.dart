import 'package:chat_application/src/features/friends/domain/model/user_info.dart';
import 'package:chat_application/src/features/friends/presentation/presenter/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'user_tile.dart';

class MyTile extends ConsumerWidget {
  const MyTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<UserInfo>(
      stream: ref.read(friendsProvider).getMyUserInfoSnapshot(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserInfo user = snapshot.data!;

          return UserTile(
            name: user.name,
            onelineInfo: user.onelineInfo,
          );
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
