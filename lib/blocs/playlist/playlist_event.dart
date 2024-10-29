abstract class PlaylistEvent {}

class AddToPlaylist extends PlaylistEvent {
  final String audioUrl;

  AddToPlaylist(this.audioUrl);
}

class RemoveFromPlaylist extends PlaylistEvent {
  final String audioUrl;

  RemoveFromPlaylist(this.audioUrl);
}

class ReorderPlaylist extends PlaylistEvent {
  final int oldIndex;
  final int newIndex;

  ReorderPlaylist(this.oldIndex, this.newIndex);
}

class LoadPlaylist extends PlaylistEvent {}
