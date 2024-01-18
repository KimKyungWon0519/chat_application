class UserInfo {
  final String uid;
  final String name;
  final String onelineInfo;
  final String code;

  const UserInfo({
    required this.uid,
    required this.name,
    required this.onelineInfo,
    required this.code,
  });

  const UserInfo.empty()
      : uid = '',
        name = '',
        onelineInfo = '',
        code = '';
}
