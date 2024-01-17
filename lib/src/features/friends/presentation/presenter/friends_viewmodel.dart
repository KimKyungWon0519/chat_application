import 'package:chat_application/src/features/friends/domain/model/user_info.dart';
import 'package:chat_application/src/features/friends/domain/usecase/users_store_usecase.dart';

class FriendsViewModel {
  final UsersStoreUseCsae _usersStoreUseCsae;

  FriendsViewModel({
    required UsersStoreUseCsae usersStoreUseCsae,
  }) : _usersStoreUseCsae = usersStoreUseCsae;

  Stream<List<UserInfo>> getUsersSnapshot() {
    return _usersStoreUseCsae.getUsersSnapshot();
  }
}
