import 'package:chat_application/src/core/constants/realtime_database_constants.dart';
import 'package:chat_application/src/features/chat/data/mapper/chat_data_mapper.dart';
import 'package:chat_application/src/features/chat/data/mapper/message_mapper.dart';
import 'package:chat_application/src/features/chat/domain/model/chat.dart';
import 'package:chat_application/src/features/chat/domain/model/message.dart';
import 'package:chat_application/src/features/chat/domain/repository/chats_realtime_db_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class ChatsRealTimeDBRepositoryImpl implements ChatsRealTimeDBRepository {
  @override
  void sendChat(
    String chatID, {
    required String comment,
    required DateTime dateTime,
  }) {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    List<String> dateTimePair = dateTime.toString().split(' ');

    FirebaseDatabase.instance
        .ref('${RealTimeDatabasePath.chats}/$chatID')
        .child(dateTimePair[0])
        .update({
      '${dateTime.microsecondsSinceEpoch}': {
        'uid': uid,
        'comment': comment,
      },
    });
  }

  @override
  Stream<List<ChatData>> getChats(String chatID) {
    return FirebaseDatabase.instance
        .ref('${RealTimeDatabasePath.chats}/$chatID')
        .onValue
        .map((event) => (event.snapshot.value as Map)
            .entries
            .toList()
            .map((e) => e.toChatData())
            .toList()
          ..sort((a, b) => a.date.compareTo(b.date)));
  }

  @override
  void deleteChat(String chatID, Message message) {
    int unixTime = DateTime.parse(message.dateTime).microsecondsSinceEpoch;

    FirebaseDatabase.instance
        .ref('${RealTimeDatabasePath.chats}/$chatID/${message.date}')
        .update({
      '$unixTime': message.copyWith(comment: null).toJson(),
    });
  }
}
