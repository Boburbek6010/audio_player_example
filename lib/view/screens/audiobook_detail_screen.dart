import 'package:audio_player_example/data/models/audiobook_model.dart';
import 'package:flutter/material.dart';
import '../../blocs/player/player_bloc.dart';
import '../../blocs/player/player_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AudiobookDetailScreen extends StatelessWidget {
  final AudiobookModel audiobook;

  const AudiobookDetailScreen(this.audiobook, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(audiobook.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Description: ${audiobook.description}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<PlayerBloc>().add(PlayAudio(audiobook));
              },
              child: const Text('Play'),
            ),
          ],
        ),
      ),
    );
  }
}
