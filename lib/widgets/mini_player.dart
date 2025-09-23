import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lyrics_viewer_app/providers/audio_provider.dart';
import 'package:lyrics_viewer_app/screens/player_screen.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use Consumer to listen to changes in the AudioProvider
    return Consumer<AudioProvider>(
      builder: (context, audioProvider, child) {
        // If no song is playing, don't show the mini-player
        if (audioProvider.currentSong == null) {
          return const SizedBox.shrink();
        }

        return GestureDetector(
          // On tap, navigate to the full player screen
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    PlayerScreen(song: audioProvider.currentSong!),
              ),
            );
          },
          child: Container(
            height: 60,
            color: Colors.black87,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                // Album Art
                ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Image.network(
                    audioProvider.currentSong!.imageUrl,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                // Song Title and Artist
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        audioProvider.currentSong!.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        audioProvider.currentSong!.artist,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                // Play/Pause Button
                IconButton(
                  onPressed: () {
                    // Control playback via the AudioProvider
                    if (audioProvider.isPlaying) {
                      audioProvider.pause();
                    } else {
                      audioProvider.resume();
                    }
                  },
                  icon: Icon(
                    audioProvider.isPlaying
                        ? Icons.pause_circle_filled
                        : Icons.play_circle_filled,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
