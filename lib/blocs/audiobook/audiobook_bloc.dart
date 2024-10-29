import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'audiobook_event.dart';
part 'audiobook_state.dart';

class AudiobookBloc extends Bloc<AudiobookEvent, AudiobookState> {
  AudiobookBloc() : super(AudiobookInitial()) {
    on<AudiobookEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
