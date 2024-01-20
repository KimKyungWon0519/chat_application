import 'package:chat_application/src/features/chats/domain/model/user_info.dart';
import 'package:chat_application/src/features/chats/domain/usecase/chats_usecase.dart';
import 'package:chat_application/src/features/chats/domain/usecase/friends_usecase.dart';
import 'package:chat_application/src/features/chats/domain/usecase/users_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConversationInviteViewModel extends StateNotifier<InvitedInfoState> {
  final GetFriendsUseCase _getFriendsUseCase;
  final GetUserInfoUseCase _getUserInfoUseCase;
  final AddChatUseCase _addChatUseCsae;

  ConversationInviteViewModel({
    required GetFriendsUseCase getFriendsUseCase,
    required GetUserInfoUseCase getUserInfoUseCase,
    required AddChatUseCase addChatUseCsae,
  })  : _getFriendsUseCase = getFriendsUseCase,
        _getUserInfoUseCase = getUserInfoUseCase,
        _addChatUseCsae = addChatUseCsae,
        super(const InvitedInfoState.empty()) {
    _getAllFriends()
        .then((value) => state = state.copyWith(friends: value.toList()));
  }

  void selectedFriend(UserInfo userInfo) {
    List<UserInfo> selectedFriends = state.selectedFriends.toList();

    selectedFriends.add(userInfo);

    state = state.copyWith(selectedFriends: selectedFriends);
  }

  void unselectedFriend(UserInfo userInfo) {
    List<UserInfo> selectedFriends = state.selectedFriends.toList();

    selectedFriends.remove(userInfo);

    state = state.copyWith(selectedFriends: selectedFriends);
  }

  void searchUserWithName(String name) async {
    List<UserInfo> users = await _getAllFriends();

    List<UserInfo> searchUsers =
        users.where((element) => element.name == name).toList();

    state = state.copyWith(friends: searchUsers.toList());
  }

  bool isSelected(UserInfo userInfo) {
    return state.selectedFriends.contains(userInfo);
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
