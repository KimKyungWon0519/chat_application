import 'package:chat_application/src/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FriendManagementTile extends StatelessWidget {
  const FriendManagementTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('친구 관리'),
      trailing: const Icon(Icons.chevron_right_rounded),
      onTap: () =>
          context.push(AppRoutes.settings + AppRoutes.friendManagement),
    );
  }
}
