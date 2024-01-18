import 'package:chat_application/src/features/friends/domain/model/user_info.dart';
import 'package:chat_application/src/features/friends/domain/usecase/friends_store_usecase.dart';
import 'package:chat_application/src/features/friends/domain/usecase/users_store_usecase.dart';

class FriendsViewModel {
  final UsersStoreUseCsae _usersStoreUseCsae;
  final FriendsStoreUseCase _friendsStoreUseCase;

  FriendsViewModel({
    required UsersStoreUseCsae usersStoreUseCsae,
    required FriendsStoreUseCase friendsStoreUseCase,
  })  : _usersStoreUseCsae = usersStoreUseCsae,
        _friendsStoreUseCase = friendsStoreUseCase;

  Stream<UserInfo> getMyUserInfoSnapshot() {
    return _usersStoreUseCsae.getMyUserInfoSnapshot();
  }

  Stream<List> getFrirendsSnaphot() {
    return _friendsStoreUseCase.getFriendsSnapshot();
  }

  Stream<UserInfo> getUserSnapshot(String uid) {
    return _usersStoreUseCsae.getUserSnapshot(uid);
  }
}
