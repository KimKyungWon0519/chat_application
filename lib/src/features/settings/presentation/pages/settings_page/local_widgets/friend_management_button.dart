import 'package:flutter/material.dart';

class FriendManagementTile extends StatelessWidget {
  const FriendManagementTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('친구 관리'),
      trailing: const Icon(Icons.chevron_right_rounded),
      onTap: () {},
    );
  }
}
