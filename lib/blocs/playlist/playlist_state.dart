abstract class PlaylistState {}

class PlaylistInitial extends PlaylistState {}

class PlaylistLoading extends PlaylistState {}

class PlaylistLoaded extends PlaylistState {
  final List<String> playlist;

  PlaylistLoaded(this.playlist);
}

class PlaylistUpdated extends PlaylistState {
  final List<String> playlist;

  PlaylistUpdated(this.playlist);
}
