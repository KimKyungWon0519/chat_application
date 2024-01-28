class UserInfo {
  final String name;
  final String uid;

  const UserInfo({
    required this.name,
    required this.uid,
  });

  @override
  bool operator ==(covariant UserInfo other) => name == other.name;
}
