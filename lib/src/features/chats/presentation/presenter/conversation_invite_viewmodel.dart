import 'package:chat_application/src/features/chats/domain/model/user_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConversationInviteViewModel extends StateNotifier<List<UserInfo>> {
  ConversationInviteViewModel() : super([]);
}
