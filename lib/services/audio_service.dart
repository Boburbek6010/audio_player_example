import 'package:audio_player_example/data/models/audiobook_model.dart';
import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import '../blocs/player/player_bloc.dart';
import '../blocs/player/player_event.dart';
import '../utils/helper.dart';

class AudioHandler extends BaseAudioHandler {
  final AudioPlayer _audioPlayer = AudioPlayer();
  List<AudiobookModel> _playlist = [];
  int _currentIndex = 0;
  final PlayerBloc playerBloc;

  AudioHandler() :playerBloc = PlayerBloc(AudioHandler()) {
    _audioPlayer.currentIndexStream.listen((index) {
      _currentIndex = index ?? 0;
    });
  }

  List<AudiobookModel> get playlist => List.unmodifiable(_playlist);

  @override
  Future<void> play() async {
    if (_playlist.isNotEmpty && _currentIndex < _playlist.length) {
      final currentAudiobook = _playlist[_currentIndex];
      final currentUrl = currentAudiobook.audioUrl;

      if (!Helpers.isValidUrl(currentUrl)) {
        throw Exception('Invalid URL: $currentUrl');
      }

      await _audioPlayer.setUrl(currentUrl);
      _audioPlayer.play();
      playerBloc.add(PlayAudio(currentAudiobook));
    }
  }


  @override
  Future<void> pause() async {
    await _audioPlayer.pause();
    playerBloc.add(PauseAudio());
  }

  Future<void> next() async {
    if (_currentIndex < _playlist.length - 1) {
      _currentIndex++;
      await play();
    }
  }

  Future<void> previous() async {
    if (_currentIndex > 0) {
      _currentIndex--;
      await play();
    }
  }

  void toggleShuffle() {
    _playlist.shuffle();
    playerBloc.add(ShufflePlaylist());
  }

  @override
  Future<void> seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  @override
  Future<void> setSpeed(double speed) async {
    await _audioPlayer.setSpeed(speed);
  }

  Future<void> setVolume(double volume) async {
    await _audioPlayer.setVolume(volume);
  }

  @override
  Future<void> stop() async {
    await _audioPlayer.stop();
    playerBloc.add(StopAudio());
  }

  void setPlaylist(List<AudiobookModel> playlist) {
    _playlist = playlist;
    playerBloc.add(UpdatePlaylist(playlist));
  }
}
