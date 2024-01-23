import 'package:chat_application/src/features/chat/presentation/presenter/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserListDrawer extends StatelessWidget {
  final String chatID;

  const UserListDrawer({
    super.key,
    required this.chatID,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const _TalkersListTitle(),
          _TalkerListView(chatID),
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

class _TalkerListView extends ConsumerWidget {
  final String chatID;

  const _TalkerListView(this.chatID, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
      stream: ref.read(chatProvider).getTalkerUIDSnapshot(chatID),
      builder: (context, snapshot) {
        List<String> talkerUID = snapshot.data ?? [];

        return Column(
          children: [
            for (int i = 0; i < talkerUID.length; i++)
              _TalkerItem(talkerUID[i]),
          ],
        );
      },
    );
  }
}

class _TalkerItem extends ConsumerWidget {
  final String uid;

  const _TalkerItem(this.uid, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
      stream: ref.read(chatProvider).getUserNameSnapshot(uid),
      builder: (context, snapshot) => ListTile(
        title: Text(snapshot.data ?? ''),
      ),
    );
  }
}
