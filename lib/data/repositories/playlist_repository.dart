import '../models/playlist_model.dart';

class PlaylistRepository {
  final List<PlaylistModel> _playlists = [];

  List<PlaylistModel> getPlaylistModels() {
    return _playlists;
  }

  void addPlaylistModel(PlaylistModel playlist) {
    _playlists.add(playlist);
  }

  void removePlaylistModel(PlaylistModel playlist) {
    _playlists.remove(playlist);
  }
}