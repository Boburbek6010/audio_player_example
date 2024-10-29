import '../../data/models/audiobook_model.dart';

abstract class AudiobookState {}

class AudiobookInitial extends AudiobookState {}

class AudiobookLoading extends AudiobookState {}

class AudiobookLoaded extends AudiobookState {
  final List<AudiobookModel> audiobooks;

  AudiobookLoaded(this.audiobooks);
}

class AudiobookError extends AudiobookState {
  final String message;

  AudiobookError(this.message);
}
