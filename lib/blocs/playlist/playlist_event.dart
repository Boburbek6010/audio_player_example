import 'package:audio_player_example/data/models/audiobook_model.dart';

abstract class PlaylistEvent {}

class AddToPlaylist extends PlaylistEvent {
  final AudiobookModel audiobookModel;

  AddToPlaylist(this.audiobookModel);
}

class RemoveFromPlaylist extends PlaylistEvent {
  final AudiobookModel audiobookModel;

  RemoveFromPlaylist(this.audiobookModel);
}

class ReorderPlaylist extends PlaylistEvent {
  final int oldIndex;
  final int newIndex;

  ReorderPlaylist(this.oldIndex, this.newIndex);
}

class LoadPlaylist extends PlaylistEvent {}
