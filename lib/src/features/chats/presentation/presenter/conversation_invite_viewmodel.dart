import 'package:chat_application/src/features/chats/domain/model/user_info.dart';
import 'package:chat_application/src/features/chats/domain/usecase/friends_usecase.dart';
import 'package:chat_application/src/features/chats/domain/usecase/users_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConversationInviteViewModel extends StateNotifier<List<UserInfo>> {
  final GetFriendsUseCase _getFriendsUseCase;
  final GetUserInfoUseCase _getUserInfoUseCase;

  ConversationInviteViewModel({
    required GetFriendsUseCase getFriendsUseCase,
    required GetUserInfoUseCase getUserInfoUseCase,
  })  : _getFriendsUseCase = getFriendsUseCase,
        _getUserInfoUseCase = getUserInfoUseCase,
        super([]) {
    _getFriendsUseCase.getAllFriends().then((value) {
      print(value);
    });
  }
}
