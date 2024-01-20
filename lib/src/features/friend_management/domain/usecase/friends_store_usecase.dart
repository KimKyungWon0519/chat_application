import 'package:chat_application/src/features/friend_management/domain/repository/friends_store_repository.dart';

class FriendsStoreUseCase {
  final FriendsStoreRepository _friendsStoreRepository;

  FriendsStoreUseCase({
    required FriendsStoreRepository friendsStoreRepository,
  }) : _friendsStoreRepository = friendsStoreRepository;

  Future<void> addFriend(String uid) {
    return _friendsStoreRepository.addFriend(uid);
  }
}
