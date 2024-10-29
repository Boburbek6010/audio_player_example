import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/player/player_bloc.dart';
import '../../blocs/player/player_event.dart';
import '../../blocs/playlist/playlist_bloc.dart';
import '../../blocs/playlist/playlist_state.dart';
import '../widgets/playlist_item.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Playlist')),
      body: BlocBuilder<PlaylistBloc, PlaylistState>(
        builder: (context, state) {
          if (state is PlaylistLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PlaylistLoaded) {
            return ListView.builder(
              itemCount: state.playlist.length,
              itemBuilder: (context, index) {
                return PlaylistItem(
                  audiobook: state.playlist[index],
                  onTap: () {
                    context.read<PlayerBloc>().add(PlayAudio(state.playlist[index]));
                  },
                );
              },
            );
          } else {
            return const Center(child: Text('No Audiobooks in Playlist'));
          }
        },
      ),
    );
  }
}
