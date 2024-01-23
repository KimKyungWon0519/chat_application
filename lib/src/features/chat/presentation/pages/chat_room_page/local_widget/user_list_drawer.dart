import 'package:flutter/material.dart';

class UserListDrawer extends StatelessWidget {
  const UserListDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: Column(
        children: [
          _TalkersListTitle(),
          ListTile(
            title: Text('나'),
          ),
          ListTile(
            title: Text('응애 응애'),
          ),
        ],
      ),
    );
  }
}

class _TalkersListTitle extends StatelessWidget {
  const _TalkersListTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          '대화상대',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
