import 'package:flutter/material.dart';

import 'user_tile.dart';

class FriendsPanel extends StatelessWidget {
  const FriendsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < 100; i++) const UserTile(),
      ],
    );
  }
}
