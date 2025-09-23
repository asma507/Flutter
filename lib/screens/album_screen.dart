import 'package:flutter/material.dart';
import 'package:lyrics_viewer_app/models/song.dart';
import 'package:lyrics_viewer_app/screens/player_screen.dart';

class AlbumScreen extends StatelessWidget {
  final String albumName;
  final String albumCover;
  final List<Song> songs;

  const AlbumScreen({
    Key? key,
    required this.albumName,
    required this.albumCover,
    required this.songs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(albumName),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          // Album Cover
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
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
                    // Play first song (example)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PlayerScreen(song: songs.first),
                      ),
                    );
                  },
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Play All"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                )
              ],
            ),
          ),

          const Divider(),

          // Songs List
          Expanded(
            child: ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                final song = songs[index];
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      song.imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(song.title,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(song.artist),
                  trailing: const Icon(Icons.play_arrow),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PlayerScreen(song: song),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
