import 'package:audio_player_example/data/models/audiobook_model.dart';
import '../repositories/audiobook_repository.dart';

class RemoteDataSource {
  final AudiobookRepository audiobookRepository;

  RemoteDataSource(this.audiobookRepository);

  Future<List<AudiobookModel>> getAudiobooks() {
    return audiobookRepository.fetchAudiobooks();
  }
}
