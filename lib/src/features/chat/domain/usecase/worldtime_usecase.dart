import 'package:chat_application/src/features/chat/domain/repository/worldtime_repository.dart';

class GetWorldTimeUseCase {
  final WorldTimeRepository _worldTimeRepository;

  GetWorldTimeUseCase({
    required WorldTimeRepository worldTimeRepository,
  }) : _worldTimeRepository = worldTimeRepository;

  Future<DateTime> getRealTime() {
    return _worldTimeRepository.getRealTime();
  }
}
