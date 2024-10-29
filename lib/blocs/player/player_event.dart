import 'package:audio_player_example/data/models/audiobook_model.dart';


abstract class PlayerEvent {}

class PlayAudio extends PlayerEvent {
  final AudiobookModel audiobook;

  PlayAudio(this.audiobook);
}

class NextAudio extends PlayerEvent {}

class PreviousAudio extends PlayerEvent {}

class ToggleShuffle extends PlayerEvent {}

class ToggleRepeat extends PlayerEvent {}

class SeekAudio extends PlayerEvent {
  final Duration position;

  SeekAudio(this.position);
}

class PauseAudio extends PlayerEvent {}

class StopAudio extends PlayerEvent {}

class ShufflePlaylist extends PlayerEvent {}

class UpdatePlaylist extends PlayerEvent {
  final List<AudiobookModel> playlist;

  UpdatePlaylist(this.playlist);
}
