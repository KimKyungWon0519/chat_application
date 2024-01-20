import 'package:chat_application/src/features/chats/domain/model/user_info.dart';
import 'package:chat_application/src/features/chats/presentation/presenter/conversation_invite_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

late final AutoDisposeStateNotifierProvider<ConversationInviteViewModel,
    InvitedInfoState> conversationInviteProvider;
