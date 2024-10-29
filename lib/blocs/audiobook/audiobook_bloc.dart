import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/audiobook_repository.dart';
import 'audiobook_event.dart';
import 'audiobook_state.dart';

class AudiobookBloc extends Bloc<AudiobookEvent, AudiobookState> {
  final AudiobookRepository audiobookRepository;

  AudiobookBloc(this.audiobookRepository) : super(AudiobookInitial()){
    on<FetchAudiobooks>((event, emit) async {
      emit(AudiobookLoading());
      try {
        final audiobooks = await audiobookRepository.fetchAudiobooks();
        log(audiobooks.first.audioUrl);
        emit(AudiobookLoaded(audiobooks));
      } catch (_) {
        emit(AudiobookError("Failed to fetch audiobooks"));}
    });
  }
}
