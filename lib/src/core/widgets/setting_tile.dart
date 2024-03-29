import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  final String name;
  final VoidCallback onTap;

  const SettingTile({
    super.key,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      trailing: const Icon(Icons.chevron_right_rounded),
      onTap: onTap,
    );
  }
}
