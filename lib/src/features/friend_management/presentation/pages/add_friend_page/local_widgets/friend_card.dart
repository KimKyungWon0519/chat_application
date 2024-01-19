// ignore_for_file: use_build_context_synchronously

import 'package:chat_application/src/core/utils/dialogs.dart';
import 'package:chat_application/src/core/values/exceptions/add_freind_exception.dart';
import 'package:chat_application/src/features/friend_management/domain/model/user_info.dart';
import 'package:chat_application/src/features/friend_management/presentation/presenter/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FriendCard extends ConsumerWidget {
  const FriendCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserInfo? user = ref.watch(addFriendProvider);

    if (user == null) return Container();

    return Card(
      margin: EdgeInsets.zero,
      child: ListTile(
        title: Text(user.name),
        trailing: TextButton(
          child: const Text('추가'),
          onPressed: () => _onPressed(user.uid, context, ref),
        ),
      ),
    );
  }

  void _onPressed(String uid, BuildContext context, WidgetRef ref) async {
    bool isLoading = true;

    Dialogs.showLoading(context, isLoading);

    try {
      await ref
          .read(addFriendProvider.notifier)
          .addFriend(uid)
          .whenComplete(() {
        isLoading = false;
        context.pop();
      });

      _showFinishDialog(context);
    } catch (e) {
      Dialogs.showError(const UnknownException(), context);
    }
  }

  void _showFinishDialog(BuildContext context) {
    if (!context.mounted) return;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('친구 추가 완료'),
        content: const Text(
          '친구 추가를 완료했습니다.\n친구 목록에서 확인해주세요.',
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('확인'),
          ),
        ],
      ),
    ).then((value) => context.pop());
  }
}
