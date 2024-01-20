import 'package:chat_application/src/features/chats/domain/model/user_info.dart';
import 'package:chat_application/src/features/chats/domain/usecase/friends_usecase.dart';
import 'package:chat_application/src/features/chats/domain/usecase/users_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConversationInviteViewModel extends StateNotifier<InvitedInfoState> {
  final GetFriendsUseCase _getFriendsUseCase;
  final GetUserInfoUseCase _getUserInfoUseCase;

  ConversationInviteViewModel({
    required GetFriendsUseCase getFriendsUseCase,
    required GetUserInfoUseCase getUserInfoUseCase,
  })  : _getFriendsUseCase = getFriendsUseCase,
        _getUserInfoUseCase = getUserInfoUseCase,
        super(const InvitedInfoState.empty()) {
    _getAllFriends()
        .then((value) => state = state.copyWith(friends: value.toList()));
  }

  Future<List<UserInfo>> _getAllFriends() async {
    return _getFriendsUseCase.getAllFriends().then((value) async {
      List<UserInfo> data = [];

      for (String uid in value) {
        data.add(await _getUserInfoUseCase.getUserInfo(uid));
      }

      return data;
    });
  }
}

class InvitedInfoState {
  final List<UserInfo> friends;
  final List<UserInfo> selectedFriends;

  const InvitedInfoState({
    required this.friends,
    required this.selectedFriends,
  });

  const InvitedInfoState.empty()
      : friends = const [],
        selectedFriends = const [];

  InvitedInfoState copyWith({
    List<UserInfo>? friends,
    List<UserInfo>? selectedFriends,
  }) {
    return InvitedInfoState(
      friends: friends ?? this.friends,
      selectedFriends: selectedFriends ?? this.selectedFriends,
    );
  }
}
