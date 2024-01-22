import 'package:chat_application/src/features/chats/domain/repository/friends_store_repository.dart';

class GetFriendsUseCase {
  final FriendsStoreRepository _friendsStoreRepository;

  GetFriendsUseCase({
    required FriendsStoreRepository friendsStoreRepository,
  }) : _friendsStoreRepository = friendsStoreRepository;

  Future<List> getAllFriends() {
    return _friendsStoreRepository.getAllFriends();
  }
}
