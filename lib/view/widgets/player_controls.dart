import 'package:audio_player_example/data/models/audiobook_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/player/player_bloc.dart';
import '../../blocs/player/player_event.dart';

class PlayerControls extends StatelessWidget {
  final AudiobookModel audiobook;

  const PlayerControls({super.key, required this.audiobook});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: const Icon(Icons.skip_previous),
          onPressed: () {
            context.read<PlayerBloc>().add(PreviousAudio());
          },
        ),
        IconButton(
          icon: const Icon(Icons.play_arrow),
          onPressed: () {
            context.read<PlayerBloc>().add(PlayAudio(audiobook));
          },
        ),
        IconButton(
          icon: const Icon(Icons.skip_next),
          onPressed: () {
            context.read<PlayerBloc>().add(NextAudio());
          },
        ),
      ],
    );
  }
}
