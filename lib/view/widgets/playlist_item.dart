import 'package:audio_player_example/data/models/audiobook_model.dart';
import 'package:flutter/material.dart';

class PlaylistItem extends StatelessWidget {
  final AudiobookModel audiobook;
  final VoidCallback onTap;

  const PlaylistItem({
    super.key,
    required this.audiobook,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(audiobook.title),
      subtitle: Text(audiobook.author),
      onTap: onTap,
    );
  }
}
