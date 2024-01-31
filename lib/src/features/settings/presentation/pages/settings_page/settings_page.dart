import 'package:chat_application/src/core/constants/app_constants.dart';
import 'package:chat_application/src/features/settings/presentation/pages/settings_page/local_widgets/account_management_button.dart';
import 'package:chat_application/src/features/settings/presentation/pages/settings_page/local_widgets/friend_management_button.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('설정'),
      ),
      body: Column(
        children: [
          const AccountManagementTile(),
          const Divider(),
          const FriendManagementTile(),
          const Spacer(),
          Text('${packageInfo.version}+${packageInfo.buildNumber}'),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
