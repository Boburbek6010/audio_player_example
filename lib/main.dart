import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/audiobook/audiobook_bloc.dart';
import 'blocs/player/player_bloc.dart';
import 'blocs/playlist/playlist_bloc.dart';
import 'data/repositories/audiobook_repository.dart';
import 'data/repositories/playlist_repository.dart';
import 'data/data_sources/remote_data_source.dart';
import 'services/audio_service.dart' as audio;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final audiobookRepository = AudiobookRepository(Dio());

    final audioHandler = audio.AudioHandler();

    final remoteDataSource = RemoteDataSource(audiobookRepository);

    final playlistRepository = PlaylistRepository();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AudiobookBloc(audiobookRepository)),
        BlocProvider(create: (_) => PlayerBloc(audioHandler)),
        BlocProvider(create: (_) => PlaylistBloc(audioHandler)),
      ],
      child: MaterialApp(
        title: 'Audiobook Player',
        theme: ThemeData(primarySwatch: Colors.blue),
      ),
    );
  }
}
