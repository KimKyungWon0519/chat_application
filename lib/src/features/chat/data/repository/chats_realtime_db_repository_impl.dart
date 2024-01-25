import 'package:chat_application/src/core/constants/realtime_database_constants.dart';
import 'package:chat_application/src/features/chat/data/mapper/chat_data_mapper.dart';
import 'package:chat_application/src/features/chat/domain/model/chat.dart';
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
        'time': dateTimePair[1],
      },
    });
  }

  @override
  Stream<List<ChatData>> getChats(String chatID) {
    return FirebaseDatabase.instance
        .ref('${RealTimeDatabasePath.chats}/$chatID')
        .onValue
        .map((event) => (event.snapshot.value as List<Map>)
            .map((e) => e.toChatData())
            .toList());
  }
}
