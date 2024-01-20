import 'package:chat_application/src/features/chats/presentation/presenter/conversation_invite_viewmodel.dart';
import 'package:chat_application/src/features/chats/presentation/presenter/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void intializeDependencyInjection() {
  /* Start Intialize ViewModel */

  conversationInviteProvider = StateNotifierProvider(
    (ref) => ConversationInviteViewModel(),
  );

  /* End Intialize ViewModel */
}
