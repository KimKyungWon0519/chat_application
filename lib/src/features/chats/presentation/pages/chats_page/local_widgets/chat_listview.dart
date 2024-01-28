import 'package:chat_application/src/core/routes/app_path_contants.dart';
import 'package:chat_application/src/core/routes/app_routes.dart';
import 'package:chat_application/src/features/chats/domain/model/chat_info.dart';
import 'package:chat_application/src/features/chats/presentation/presenter/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ChatListView extends ConsumerWidget {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<ChatInfo> chats = ref.watch(chatsProvider);

    return ListView.builder(
      itemBuilder: (context, index) => _ChatItem(chatInfo: chats[index]),
      itemCount: chats.length,
    );
  }
}

class _ChatItem extends StatelessWidget {
  final ChatInfo chatInfo;

  const _ChatItem({
    super.key,
    required this.chatInfo,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(chatInfo.name),
      onTap: () => context.pushNamed(
        ChatsSubRoutes.chatRoom.name,
        pathParameters: {
          ChatRoomParamter.chatID: chatInfo.id,
        },
      ),
    );
  }
}
