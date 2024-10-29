
import '../../data/models/audiobook_model.dart';

abstract class PlaylistState {}

class PlaylistInitial extends PlaylistState {}

class PlaylistLoading extends PlaylistState {}

class PlaylistLoaded extends PlaylistState {
  final List<AudiobookModel> playlist;

  PlaylistLoaded(this.playlist);
}

class PlaylistUpdated extends PlaylistState {
  final List<AudiobookModel> playlist;

  PlaylistUpdated(this.playlist);
}
