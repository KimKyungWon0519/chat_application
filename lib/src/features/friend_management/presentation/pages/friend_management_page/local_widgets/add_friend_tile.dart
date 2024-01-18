import 'package:flutter/material.dart';

class AddFriendTile extends StatelessWidget {
  const AddFriendTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('친구 추가'),
      trailing: IconButton(
        icon: const Icon(Icons.chevron_right),
        onPressed: () {},
      ),
    );
  }
}
