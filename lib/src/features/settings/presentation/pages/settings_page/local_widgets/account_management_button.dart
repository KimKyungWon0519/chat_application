import 'package:chat_application/src/core/routes/app_routes.dart';
import 'package:chat_application/src/core/widgets/setting_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AccountManagementTile extends StatelessWidget {
  const AccountManagementTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingTile(
      name: '계정 설정',
      onTap: () =>
          context.pushNamed(AccountManagementRoutes.accountManagement.name),
    );
  }
}
