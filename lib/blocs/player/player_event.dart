abstract class PlayerEvent {}

class PlayAudio extends PlayerEvent {
  final String audioUrl;

  PlayAudio(this.audioUrl);
}

class PauseAudio extends PlayerEvent {}

class NextAudio extends PlayerEvent {}

class PreviousAudio extends PlayerEvent {}

class ToggleShuffle extends PlayerEvent {}

class ToggleRepeat extends PlayerEvent {}

class SeekAudio extends PlayerEvent {
  final Duration position;

  SeekAudio(this.position);
}

