import 'package:chat_application/src/features/friend_management/domain/repository/user_store_repository.dart';
import 'package:chat_application/src/features/friend_management/domain/model/user_info.dart';

class UsersStoreUseCase {
  final UsersStoreRepository _usersStoreRepository;

  const UsersStoreUseCase({
    required UsersStoreRepository usersStoreRepository,
  }) : _usersStoreRepository = usersStoreRepository;

  Future<String> getMyCode() {
    return _usersStoreRepository.getMyCode();
  }

  Future<UserInfo?> getUserWithCode(String code) {
    return _usersStoreRepository.getUserWithCode(code);
  }
}
