import 'package:chat_application/src/core/routes/app_routes.dart';
import 'package:chat_application/src/core/widgets/setting_tile.dart';
import 'package:chat_application/src/features/account_management/presentation/presenter/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignoutTile extends ConsumerWidget {
  const SignoutTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SettingTile(
      name: '로그아웃',
      onTap: () {
        ref
            .read(accountManagementProvider)
            .signout()
            .then((value) => context.goNamed(AuthRoutes.signin.name));
      },
    );
  }
}
