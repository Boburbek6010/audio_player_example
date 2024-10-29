import 'package:audio_player_example/data/models/audiobook_model.dart';
import 'package:flutter/material.dart';

class AudiobookCard extends StatelessWidget {
  final AudiobookModel audiobook;
  final VoidCallback onTap;

  const AudiobookCard({super.key, required this.audiobook, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(audiobook.title),
        subtitle: Text(audiobook.author),
        onTap: onTap,
      ),
    );
  }
}
