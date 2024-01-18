import 'package:chat_application/src/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddFriendTile extends StatelessWidget {
  const AddFriendTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('친구 추가'),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => context.pushNamed(FriendManagementRoutes.addFriend.name),
    );
  }
}
