import 'package:flutter/material.dart';

import 'local_widgets/add_friend_tile.dart';

class FriendManagementPage extends StatelessWidget {
  const FriendManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('친구 관리'),
      ),
      body: const Column(
        children: [
          AddFriendTile(),
        ],
      ),
    );
  }
}
