import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      title: Text('유저 이름'),
      subtitle: Text('한 줄 소개'),
      leading: Icon(Icons.account_circle),
    );
  }
}
