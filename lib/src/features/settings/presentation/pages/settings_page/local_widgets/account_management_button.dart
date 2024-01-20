import 'package:chat_application/src/core/routes/app_routes.dart';
import 'package:chat_application/src/core/widgets/management_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AccountManagementButton extends StatelessWidget {
  const AccountManagementButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ManagementButton(
      name: '계정 설정',
      onTap: () =>
          context.pushNamed(AccountManagementRoutes.accountManagement.name),
    );
  }
}
