import 'package:chat_application/src/features/auth/domain/repository/users_store_repository.dart';

class CreateUserInfoUseCase {
  final UsersStoreRepository _usersStoreRepository;

  CreateUserInfoUseCase({
    required UsersStoreRepository usersStoreRepository,
  }) : _usersStoreRepository = usersStoreRepository;
}
