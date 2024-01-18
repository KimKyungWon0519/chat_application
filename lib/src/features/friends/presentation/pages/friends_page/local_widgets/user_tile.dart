import 'package:chat_application/src/features/friends/domain/model/user_info.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final UserInfo userInfo;

  const UserTile({
    super.key,
    required this.userInfo,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(userInfo.name),
      subtitle: Text(userInfo.onelineInfo),
      leading: const Icon(Icons.account_circle),
    );
  }
}
