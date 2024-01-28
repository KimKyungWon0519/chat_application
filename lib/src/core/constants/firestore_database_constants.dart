final class FirestoreDatabasePath {
  const FirestoreDatabasePath._();

  static const String users = 'users';
  static const String friends = 'friends';
  static const String chats = 'chats';
}

final class UserFieldKey {
  const UserFieldKey._();

  static const String name = 'name';
  static const String code = 'code';
  static const String onelineInfo = 'oneline_info';
}

final class FriendFieldKey {
  const FriendFieldKey._();

  static const String uids = 'uids';
}

final class ChatFieldKey {
  const ChatFieldKey._();

  static const String uids = 'uids';
  static const String name = 'name';
}
