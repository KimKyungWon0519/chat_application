import 'package:chat_application/src/core/routes/app_routes.dart';
import 'package:chat_application/src/core/widgets/management_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddFriendTile extends StatelessWidget {
  const AddFriendTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ManagementTile(
      name: '친구 추가',
      onTap: () => context.pushNamed(FriendManagementRoutes.addFriend.name),
    );
  }
}
