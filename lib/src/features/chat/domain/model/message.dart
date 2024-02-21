class Message {
  final String uid;
  final String? comment;
  final String dateTime;

  const Message({
    required this.uid,
    required this.comment,
    required this.dateTime,
  });

  Message copyWith({String? comment}) {
    return Message(
      uid: uid,
      comment: comment,
      dateTime: dateTime,
    );
  }

  String get date => dateTime.split(' ')[0];
  String get time => dateTime.split(' ')[1];
}
