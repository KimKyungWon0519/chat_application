abstract class UserStoreRepository {
  Stream<String> getUserNameSnapshot(String uid);
  bool isMyUid(String uid);
}
