import 'package:chat_application/src/core/routes/app_routes.dart';
import 'package:chat_application/src/core/widgets/setting_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FriendManagementTile extends StatelessWidget {
  const FriendManagementTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingTile(
      name: '친구 관리',
      onTap: () =>
          context.pushNamed(FriendManagementRoutes.friendManagement.name),
    );
  }
}
