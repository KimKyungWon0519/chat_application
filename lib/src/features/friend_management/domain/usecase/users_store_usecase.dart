import 'package:chat_application/src/features/friend_management/domain/repository/user_store_repository.dart';

class UsersStoreUseCase {
  final UsersStoreRepository _usersStoreRepository;

  const UsersStoreUseCase({
    required UsersStoreRepository usersStoreRepository,
  }) : _usersStoreRepository = usersStoreRepository;

  Future<String> getMyCode() {
    return _usersStoreRepository.getMyCode();
  }
}
