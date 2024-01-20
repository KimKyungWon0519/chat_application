import 'package:flutter/material.dart';

class FriendsListView extends StatelessWidget {
  const FriendsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.account_circle),
          title: const Text('이름'),
          trailing: Checkbox(
            value: false,
            onChanged: (value) {},
          ),
        );
      },
      itemCount: 100,
    );
  }
}
