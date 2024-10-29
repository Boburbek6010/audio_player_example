import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

class AudioHandler extends BaseAudioHandler {
  final AudioPlayer _audioPlayer = AudioPlayer();
  List<String> _playlist = []; 
  int _currentIndex = 0;

  AudioHandler() {
    _audioPlayer.currentIndexStream.listen((index) {
      _currentIndex = index ?? 0;
    });
  }

  List<String> get playlist => List.unmodifiable(_playlist);

  @override
  Future<void> play() async {
    if (_playlist.isNotEmpty && _currentIndex < _playlist.length) {
      await _audioPlayer.setUrl(_playlist[_currentIndex]); 
      _audioPlayer.play(); 
    }
  }

  @override
  Future<void> pause() async {
    await _audioPlayer.pause(); 
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
  }

  void setPlaylist(List<String> playlist) {
    _playlist = playlist;
  }
}
