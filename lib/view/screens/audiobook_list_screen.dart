import 'package:flutter/material.dart';
import '../../blocs/audiobook/audiobook_bloc.dart';
import '../../blocs/audiobook/audiobook_state.dart';
import '../widgets/audiobook_card.dart';
import 'audiobook_detail_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AudiobookListScreen extends StatelessWidget {
  const AudiobookListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Audiobook List')),
      body: BlocBuilder<AudiobookBloc, AudiobookState>(
        builder: (context, state) {
          if (state is AudiobookLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AudiobookLoaded) {
            final audiobooks = state.audiobooks;
            return ListView.builder(
              itemCount: audiobooks.length,
              itemBuilder: (context, index) {
                final audiobook = audiobooks[index];
                return AudiobookCard(
                  audiobook: audiobook,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AudiobookDetailScreen(audiobook),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return Center(child: Text('Failed to load audiobooks.'));
          }
        },
      ),
    );
  }
}
