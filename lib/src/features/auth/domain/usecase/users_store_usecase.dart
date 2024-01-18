import 'package:chat_application/src/features/auth/domain/repository/users_store_repository.dart';

class UsersStoreUseCase {
  final UsersStoreRepository _usersStoreRepository;

  UsersStoreUseCase({
    required UsersStoreRepository usersStoreRepository,
  }) : _usersStoreRepository = usersStoreRepository;
}
