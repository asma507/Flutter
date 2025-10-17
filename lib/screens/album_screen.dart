import 'package:flutter/material.dart';
import 'package:lyrics_viewer_app/models/song.dart';
import 'package:lyrics_viewer_app/screens/player_screen.dart';
import 'package:provider/provider.dart';
import 'package:lyrics_viewer_app/providers/audio_provider.dart';

class AlbumScreen extends StatelessWidget {
  final String albumName;
  final String albumCover;
  final List<Song> songs;

  const AlbumScreen({
    super.key,
    required this.albumName,
    required this.albumCover,
    required this.songs,
  });

  @override
  Widget build(BuildContext context) {
    final audioProvider = context.read<AudioProvider>(); // ✅ get provider

    return Scaffold(
      appBar: AppBar(
        title: Text(albumName),
        backgroundColor: const Color.fromARGB(255, 180, 67, 200),
      ),
      body: Column(
        children: [
          // 🔹 Album Cover & Details
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    albumCover,
                    height: 180,
                    width: 180,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  albumName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton.icon(
                  onPressed: () {
                    // ✅ Play all songs starting from the first one
                    audioProvider.setPlaylist(songs, startSong: songs.first);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PlayerScreen(
                          song: songs.first,
                          playlist: songs,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Play All"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 208, 202, 209),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Divider(),

          // 🔹 Songs List
          Expanded(
            child: ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                final song = songs[index];
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      song.imagePath, // ✅ fixed property name
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    song.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(song.artist),
                  trailing: const Icon(Icons.play_arrow),
                  onTap: () {
                    // ✅ Tell audio provider to play the selected song
                    audioProvider.setPlaylist(songs, startSong: song);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PlayerScreen(
                          song: song,
                          playlist: songs,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
