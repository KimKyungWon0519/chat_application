class UserInfo {
  final String uid;
  final String name;

  const UserInfo({
    required this.uid,
    required this.name,
  });

  const UserInfo.empty()
      : uid = '',
        name = '';
}
