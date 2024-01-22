import 'package:chat_application/src/features/chats/domain/model/user_info.dart';
import 'package:chat_application/src/features/chats/domain/repository/users_store_repository.dart';

class GetUserInfoUseCase {
  final UsersStoreRepository _usersStoreRepository;

  GetUserInfoUseCase({
    required UsersStoreRepository usersStoreRepository,
  }) : _usersStoreRepository = usersStoreRepository;

  Future<UserInfo> getUserInfo(String uid) {
    return _usersStoreRepository.getUserInfo(uid);
  }

  String getMyUid() => _usersStoreRepository.getMyUid();
}
