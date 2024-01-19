import 'package:chat_application/src/features/friend_management/data/repository/user_store_repository_impl.dart';
import 'package:chat_application/src/features/friend_management/domain/repository/user_store_repository.dart';
import 'package:chat_application/src/features/friend_management/domain/usecase/users_store_usecase.dart';
import 'package:chat_application/src/features/friend_management/presentation/presenter/add_friend_viewmodel.dart';
import 'package:chat_application/src/features/friend_management/presentation/presenter/providers.dart';
import 'package:chat_application/src/features/friend_management/domain/model/user_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void initializeDependencyInjection() {
  /* Start Initialize Repository */

  UsersStoreRepository usersStoreRepository = UsersStoreRepositoryImpl();

  /* End Initialize Repository */

  /* Start Initialize UseCase */

  UsersStoreUseCase usersStoreUseCase = UsersStoreUseCase(
    usersStoreRepository: usersStoreRepository,
  );

  /* End Initialize UseCase */

  /* Start Initialize ViewModel */

  addFriendProvider = StateNotifierProvider<AddFriendViewModel, UserInfo?>(
    (ref) => AddFriendViewModel(usersStoreUseCase: usersStoreUseCase),
  );

  /* End Initialize ViewModel */
}
