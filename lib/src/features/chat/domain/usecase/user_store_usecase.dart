import 'package:chat_application/src/features/chat/domain/repository/user_store_repository.dart';

class GetUserDataUseCase {
  final UserStoreRepository _userStoreRepository;

  GetUserDataUseCase({
    required UserStoreRepository userStoreRepository,
  }) : _userStoreRepository = userStoreRepository;

  Stream<String> getuserNameSnapshot(String uid) {
    return _userStoreRepository.getUserNameSnapshot(uid);
  }
}
