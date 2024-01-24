import 'package:chat_application/src/core/constants/realtime_database_constants.dart';
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

    FirebaseDatabase.instance.ref('${RealTimeDatabasePath.chats}/$chatID').set({
      '${dateTime.microsecondsSinceEpoch}': {
        'uid': uid,
        'comment': comment,
        'dateTime': dateTime.toString(),
      },
    });
  }
}
