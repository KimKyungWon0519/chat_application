import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String name;
  final String onelineInfo;

  const UserTile({
    super.key,
    required this.name,
    required this.onelineInfo,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text(onelineInfo),
      leading: const Icon(Icons.account_circle),
    );
  }
}
