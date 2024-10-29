import 'package:flutter_bloc/flutter_bloc.dart';
import 'playlist_event.dart';
import 'playlist_state.dart';
import '../../services/audio_service.dart';

class PlaylistBloc extends Bloc<PlaylistEvent, PlaylistState> {
  final AudioHandler audioHandler;

  PlaylistBloc(this.audioHandler) : super(PlaylistInitial());

  // ignore: invalid_override
  @override
  Stream<PlaylistState> mapEventToState(PlaylistEvent event) async* {
    if (event is LoadPlaylist) {
      yield PlaylistLoading();
      final playlist = audioHandler.playlist;
      yield PlaylistLoaded(playlist);
    } else if (event is AddToPlaylist) {
      audioHandler.setPlaylist([...audioHandler.playlist, event.audiobookModel]);
      yield PlaylistUpdated(audioHandler.playlist);
    } else if (event is RemoveFromPlaylist) {
      audioHandler.setPlaylist(audioHandler.playlist.where((url) => url != event.audiobookModel).toList());
      yield PlaylistUpdated(audioHandler.playlist);
    } else if (event is ReorderPlaylist) {
      final item = audioHandler.playlist.removeAt(event.oldIndex);
      audioHandler.playlist.insert(event.newIndex, item);
      yield PlaylistUpdated(audioHandler.playlist);
    }
  }
}
