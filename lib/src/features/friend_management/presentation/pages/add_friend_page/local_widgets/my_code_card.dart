import 'package:chat_application/src/features/friend_management/presentation/presenter/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyCodeCard extends StatelessWidget {
  const MyCodeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      margin: EdgeInsets.zero,
      child: ListTile(
        title: Text('내 코드'),
        trailing: _CodeText(),
      ),
    );
  }
}

class _CodeText extends ConsumerWidget {
  const _CodeText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: ref.read(addFriendProvider.notifier).getMyCode(),
      builder: (context, snapshot) {
        return Text(
          snapshot.data ?? '',
        );
      },
    );
  }
}
