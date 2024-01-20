import 'package:chat_application/src/features/chats/domain/repository/users_store_repository.dart';

class GetUserInfoUseCase {
  final UsersStoreRepository _usersStoreRepository;

  GetUserInfoUseCase({
    required UsersStoreRepository usersStoreRepository,
  }) : _usersStoreRepository = usersStoreRepository;
}
