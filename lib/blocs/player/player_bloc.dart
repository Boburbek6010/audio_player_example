import 'package:audio_player_example/blocs/player/player_event.dart';
import 'package:audio_player_example/blocs/player/player_state.dart';
import 'package:audio_service/audio_service.dart' hide AudioHandler;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/audio_service.dart' as service;

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  final service.AudioHandler audioHandler;

  PlayerBloc(this.audioHandler) : super(PlayerInitial());

  // ignore: invalid_override
  @override
  Stream<PlayerState> mapEventToState(PlayerEvent event) async* {
    if (event is PlayAudio) {
      audioHandler.setPlaylist([event.audioUrl]);
      await audioHandler.play();
      yield PlayerPlaying();
    } else if (event is PauseAudio) {
      await audioHandler.pause();
      yield PlayerPaused();
    } else if (event is NextAudio) {
      await audioHandler.next();
      yield PlayerPlaying();
    } else if (event is PreviousAudio) {
      await audioHandler.previous();
      yield PlayerPlaying();
    } else if (event is ToggleShuffle) {
      audioHandler.toggleShuffle();
      yield PlayerShuffled();
    }
  }

}
