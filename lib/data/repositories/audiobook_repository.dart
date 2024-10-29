import 'package:audio_player_example/data/models/audiobook_model.dart';
import 'package:dio/dio.dart';

class AudiobookRepository {
  final Dio dio;

  AudiobookRepository(this.dio);

  Future<List<AudiobookModel>> fetchAudiobooks() async {
    final response = await dio.get('https://librivox.org/api/feed/books?format=json');
    final List<AudiobookModel> audiobooks = (response.data['books'] as List).map((json) => AudiobookModel.fromJson(json)).toList();
    return audiobooks;
  }
}
