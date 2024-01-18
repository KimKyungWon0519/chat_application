import 'package:chat_application/src/features/friend_management/domain/usecase/users_store_usecase.dart';
import 'package:chat_application/src/features/friend_management/domain/model/user_info.dart';

class AddFriendViewModel {
  final UsersStoreUseCase _usersStoreUseCase;

  AddFriendViewModel({
    required UsersStoreUseCase usersStoreUseCase,
  }) : _usersStoreUseCase = usersStoreUseCase;

  Future<String> getMyCode() {
    return _usersStoreUseCase.getMyCode();
  }

  Future<UserInfo> getUserWithCode(String code) {
    return _usersStoreUseCase.getUserWithCode(code);
  }
}
