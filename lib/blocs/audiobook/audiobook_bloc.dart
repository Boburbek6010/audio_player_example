import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/audiobook_repository.dart';
import 'audiobook_event.dart';
import 'audiobook_state.dart';

class AudiobookBloc extends Bloc<AudiobookEvent, AudiobookState> {
  final AudiobookRepository audiobookRepository;

  AudiobookBloc(this.audiobookRepository) : super(AudiobookInitial());

  // ignore: invalid_override
  @override
  Stream<AudiobookState> mapEventToState(AudiobookEvent event) async* {
    if (event is FetchAudiobooks) {
      yield AudiobookLoading();
      try {
        final audiobooks = await audiobookRepository.fetchAudiobooks();
        yield AudiobookLoaded(audiobooks);
      } catch (_) {
        yield AudiobookError("Failed to fetch audiobooks");
      }
    }
  }
}
