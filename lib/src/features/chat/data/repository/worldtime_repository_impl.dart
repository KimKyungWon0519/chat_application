import 'package:chat_application/src/features/chat/data/data_source/worldtime_client.dart';
import 'package:chat_application/src/features/chat/domain/repository/worldtime_repository.dart';

class WorldTimeRepositoryImpl extends WorldTimeRepository {
  final WorldTimeClient _worldTimeClient;

  WorldTimeRepositoryImpl({
    required WorldTimeClient worldTimeClient,
  }) : _worldTimeClient = worldTimeClient;

  @override
  Future<DateTime> getRealTime() async {
    Map<String, dynamic> response = await _worldTimeClient.getWorldTime();
    String time = response['datetime'];
    time = time.substring(0, time.length - '+00:00'.length);

    return DateTime.parse(time);
  }
}
