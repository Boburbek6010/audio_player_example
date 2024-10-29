import '../repositories/local_storage_repository.dart';

class LocalDataSource {
  final LocalStorageRepository localStorageRepository;

  LocalDataSource(this.localStorageRepository);

  Future<void> saveLastPlayed(String audioUrl, int position) {
    return localStorageRepository.saveLastPlayed(audioUrl, position);
  }

  Future<String?> getLastPlayedAudio() {
    return localStorageRepository.getLastPlayedAudio();
  }

  Future<int> getLastPlayedPosition() {
    return localStorageRepository.getLastPlayedPosition();
  }
}
