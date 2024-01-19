import 'package:chat_application/src/features/friend_management/domain/usecase/users_store_usecase.dart';
import 'package:chat_application/src/features/friend_management/domain/model/user_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddFriendViewModel extends StateNotifier<UserInfo?> {
  final UsersStoreUseCase _usersStoreUseCase;

  AddFriendViewModel({
    required UsersStoreUseCase usersStoreUseCase,
  })  : _usersStoreUseCase = usersStoreUseCase,
        super(const UserInfo.empty());

  Future<String> getMyCode() {
    return _usersStoreUseCase.getMyCode();
  }

  void findUserWithCode(String code) {
    _usersStoreUseCase.getUserWithCode(code).then((value) => state = value);
  }
}
