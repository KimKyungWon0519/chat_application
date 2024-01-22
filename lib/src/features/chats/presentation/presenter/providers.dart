import 'package:chat_application/src/features/chats/domain/model/chat_info.dart';
import 'package:chat_application/src/features/chats/domain/model/user_info.dart';
import 'package:chat_application/src/features/chats/presentation/presenter/chats_viewmodel.dart';
import 'package:chat_application/src/features/chats/presentation/presenter/conversation_invite_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

late final AutoDisposeStateNotifierProvider<ConversationInviteViewModel,
    InvitedInfoState> conversationInviteProvider;
late final AutoDisposeStateNotifierProvider<ChatsViewModel, List<ChatInfo>>
    chatsProvider;
