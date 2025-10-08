import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lyrics_viewer_app/providers/audio_provider.dart';

class MiniPlayer extends StatelessWidget {
  final VoidCallback? onClose; // callback for dismiss

  const MiniPlayer({super.key, this.onClose});

  @override
  Widget build(BuildContext context) {
    final audioProv = Provider.of<AudioProvider>(context);
    final song = audioProv.currentSong;

    if (song == null) {
      return const SizedBox.shrink(); // nothing playing
    }

    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Image.network(
            song.imagePath,
            height: 40,
            width: 40,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              '${song.title} - ${song.artist}',
              style: const TextStyle(color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            icon: Icon(
              audioProv.isPlaying ? Icons.pause : Icons.play_arrow,
              color: Colors.white,
            ),
            onPressed: audioProv.togglePlayPause,
          ),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: onClose, // call callback instead of stop
          ),
        ],
      ),
    );
  }
}
