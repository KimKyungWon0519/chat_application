import 'package:chat_application/src/features/friend_management/domain/usecase/users_store_usecase.dart';

class AddFriendViewModel {
  final UsersStoreUseCase _usersStoreUseCase;

  AddFriendViewModel({
    required UsersStoreUseCase usersStoreUseCase,
  }) : _usersStoreUseCase = usersStoreUseCase;
}
