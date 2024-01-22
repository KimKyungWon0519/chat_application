import 'dart:async';

import 'package:chat_application/src/features/chats/domain/model/chat_info.dart';
import 'package:chat_application/src/features/chats/domain/usecase/chats_usecase.dart';
import 'package:chat_application/src/features/chats/domain/usecase/users_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatsViewModel extends StateNotifier<List<ChatInfo>> {
  final GetChatUseCase _getChatUseCase;
  final GetUserInfoUseCase _getUserInfoUseCase;

  late final StreamSubscription _subscription;

  ChatsViewModel({
    required GetChatUseCase getChatUseCase,
    required GetUserInfoUseCase getUserInfoUseCase,
  })  : _getChatUseCase = getChatUseCase,
        _getUserInfoUseCase = getUserInfoUseCase,
        super([]) {
    _subscription = _getChatUseCase.getChatsSnapshot().listen((event) async {
      for (int i = 0; i < event.length; i++) {
        ChatInfo chat = event[i];

        if (chat.uids.length == 2 && chat.name.isEmpty) {
          String friendUid = chat.uids.singleWhere(
              (element) => element != _getUserInfoUseCase.getMyUid());
          String friendName =
              (await _getUserInfoUseCase.getUserInfo(friendUid)).name;

          event[i] = chat.copyWith(name: friendName);
        }
      }

      state = event;
    });
  }

  @override
  void dispose() {
    _subscription.cancel();

    super.dispose();
  }
}
