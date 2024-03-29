import 'package:chat_application/src/features/auth/domain/repository/users_store_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateUserInfoUseCase {
  final UsersStoreRepository _usersStoreRepository;

  CreateUserInfoUseCase({
    required UsersStoreRepository usersStoreRepository,
  }) : _usersStoreRepository = usersStoreRepository;

  Future<void> createUserInfo(String uid, String name) {
    return _usersStoreRepository.createUserInfo(uid, name);
  }
}
