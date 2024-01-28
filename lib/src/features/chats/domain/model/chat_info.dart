class ChatInfo {
  final String id;
  final String name;
  final List<String> uids;

  const ChatInfo({
    required this.id,
    required this.name,
    required this.uids,
  });

  ChatInfo copyWith({
    String? id,
    String? name,
    List<String>? uids,
  }) {
    return ChatInfo(
      id: id ?? this.id,
      name: name ?? this.name,
      uids: uids ?? this.uids,
    );
  }
}
