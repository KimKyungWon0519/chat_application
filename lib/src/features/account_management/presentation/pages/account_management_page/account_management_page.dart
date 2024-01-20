import 'package:chat_application/src/features/account_management/presentation/pages/account_management_page/local_widgets/signout_tile.dart';
import 'package:flutter/material.dart';

class AccountManagementPage extends StatelessWidget {
  const AccountManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('계정 설정'),
      ),
      body: const Column(
        children: [
          SignoutTile(),
        ],
      ),
    );
  }
}
