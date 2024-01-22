import 'package:chat_application/src/core/routes/app_path_contants.dart';
import 'package:chat_application/src/core/routes/app_routes.dart';
import 'package:chat_application/src/core/utils/dialogs.dart';
import 'package:chat_application/src/features/chats/domain/model/user_info.dart';
import 'package:chat_application/src/features/chats/presentation/presenter/conversation_invite_viewmodel.dart';
import 'package:chat_application/src/features/chats/presentation/presenter/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class OkayButton extends ConsumerWidget {
  const OkayButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<UserInfo> selectedFriends =
        ref.watch(conversationInviteProvider).selectedFriends;
    return TextButton(
      onPressed:
          selectedFriends.isNotEmpty ? () => _onPressed(context, ref) : null,
      child: const Text('확인'),
    );
  }

  void _onPressed(BuildContext context, WidgetRef ref) async {
    bool isLoading = false;
    Dialogs.showLoading(context, isLoading);

    ConversationInviteViewModel conversationInviteViewModel =
        ref.read(conversationInviteProvider.notifier);

    String? chatID = await conversationInviteViewModel.getChatID();

    chatID ??= await conversationInviteViewModel.createChat();

    isLoading = false;

    if (context.mounted) {
      context.pop();
      context.replaceNamed(
        ChatsSubRoutes.chatRoom.name,
        pathParameters: {
          ChatRoomParamter.chatID: chatID!,
        },
      );
    }
  }
}
