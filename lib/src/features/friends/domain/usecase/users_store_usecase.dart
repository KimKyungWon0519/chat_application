import 'package:chat_application/src/features/friends/domain/model/user_info.dart';
import 'package:chat_application/src/features/friends/domain/repository/users_store_repository.dart';

class UsersStoreUseCsae {
  final UsersStoreRepository _usersStoreRepository;

  UsersStoreUseCsae({
    required UsersStoreRepository usersStoreRepository,
  }) : _usersStoreRepository = usersStoreRepository;

  Stream<UserInfo> getMyUserInfoSnapshot() {
    return _usersStoreRepository.getMyUserInfoSnapshot();
  }

  Stream<UserInfo> getUserSnapshot(String uid) {
    return _usersStoreRepository.getUserInfoSnapshot(uid);
  }
}
