import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lyrics_viewer_app/providers/audio_provider.dart';

class PlayerControls extends StatelessWidget {
  const PlayerControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use Consumer to listen for changes from the AudioProvider
    return Consumer<AudioProvider>(
      builder: (context, audioProvider, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Main Play/Pause Button
            FloatingActionButton(
              onPressed: () {
                if (audioProvider.isPlaying) {
                  audioProvider.pause();
                } else {
                  audioProvider.resume();
                }
              },
              backgroundColor: Colors.blueAccent,
              child: Icon(
                audioProvider.isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.white,
                size: 36,
              ),
            ),
            const SizedBox(width: 16),
            // Favorite/Like Button
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey, width: 1.0),
              ),
              child: IconButton(
                onPressed: () {
                  // TODO: Implement favorite functionality
                },
                icon: const Icon(Icons.favorite_border, color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }
}
