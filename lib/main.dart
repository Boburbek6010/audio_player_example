import 'package:audio_player_example/view/screens/audiobook_list_screen.dart';
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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final audiobookRepository = AudiobookRepository(Dio());
    final remoteDataSource = RemoteDataSource(audiobookRepository);
    final playlistRepository = PlaylistRepository();

    final audioHandler = audio.AudioHandler();
    final playerBloc = PlayerBloc(audioHandler);

    audioHandler.initialize(playerBloc);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AudiobookBloc(audiobookRepository)),
        BlocProvider(create: (_) => playerBloc),
        BlocProvider(create: (_) => PlaylistBloc(playlistRepository)),
      ],
      child: MaterialApp(
        title: 'Audiobook Player',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const AudiobookListScreen(),
      ),
    );
  }
}
