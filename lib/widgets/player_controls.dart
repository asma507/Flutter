import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/audio_provider.dart';

class PlayerControls extends StatelessWidget {
  const PlayerControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AudioProvider>(
      builder: (context, audioProvider, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Previous
            IconButton(
              icon: const Icon(Icons.skip_previous, size: 36),
              onPressed: audioProvider.playPrevious,
            ),

            // Play/Pause
            FloatingActionButton(
              onPressed: audioProvider.togglePlayPause,
              backgroundColor: Colors.deepPurple,
              child: Icon(
                audioProvider.isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.white,
                size: 36,
              ),
            ),

            // Next
            IconButton(
              icon: const Icon(Icons.skip_next, size: 36),
              onPressed: audioProvider.playNext,
            ),
          ],
        );
      },
    );
  }
}
