import 'package:chat_application/src/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('채팅'),
        actions: [
          IconButton(
            onPressed: () =>
                context.pushNamed(ChatsSubRoutes.conversationInvite.name),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
