import 'package:chat_application/src/features/friends/domain/repository/friends_store_repository.dart';

class FriendsStoreUseCase {
  final FriendsStoreRepository _friendsStoreRepository;

  FriendsStoreUseCase({
    required FriendsStoreRepository friendsStoreRepository,
  }) : _friendsStoreRepository = friendsStoreRepository;
}
