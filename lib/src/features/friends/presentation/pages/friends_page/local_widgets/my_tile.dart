import 'package:chat_application/src/features/friends/presentation/presenter/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'user_tile.dart';

class MyTile extends ConsumerWidget {
  const MyTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
      stream: ref.read(friendsProvider).getUsersSnapshot(),
      builder: (context, snapshot) {
        return const UserTile();
      },
    );
  }
}
