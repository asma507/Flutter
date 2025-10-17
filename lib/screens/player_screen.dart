import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../models/song.dart';
import '../providers/audio_provider.dart';
import '../widgets/lyrics_view.dart';
import '../widgets/player_controls.dart';

class PlayerScreen extends StatefulWidget {
  final Song song;
  final List<Song> playlist;

  const PlayerScreen({super.key, required this.song, required this.playlist});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  String _lyrics = "";

  @override
  void initState() {
    super.initState();
    _loadLyrics();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final audioProvider = Provider.of<AudioProvider>(context, listen: false);
      await audioProvider.setPlaylist(widget.playlist);
      await audioProvider.playSong(widget.song);
    });
  }

  Future<void> _loadLyrics() async {
    try {
      final loadedLyrics = await rootBundle.loadString(widget.song.lyricsPath);
      setState(() => _lyrics = loadedLyrics);
    } catch (e) {
      debugPrint("Error loading lyrics: $e");
      setState(() => _lyrics = "No lyrics available.");
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final audioProvider = Provider.of<AudioProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.song.title),
        backgroundColor: const Color.fromARGB(255, 121, 82, 188),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // Album Art
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              widget.song.imagePath,
              height: 250,
              width: 250,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          // Title & Artist
          Text(widget.song.title,
              style:
                  const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Text(widget.song.artist, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 20),
          // Lyrics
          Expanded(
            child: _lyrics.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : LyricsView(
                    lyrics: _lyrics,
                    currentTime: audioProvider.currentPosition,
                  ),
          ),
          // Slider
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_formatDuration(audioProvider.currentPosition)),
                Text(_formatDuration(audioProvider.totalDuration)),
              ],
            ),
          ),
          Slider(
            value: audioProvider.currentPosition.inSeconds.toDouble(),
            max: audioProvider.totalDuration.inSeconds > 0
                ? audioProvider.totalDuration.inSeconds.toDouble()
                : 1,
            onChanged: (value) {
              audioProvider.seek(Duration(seconds: value.toInt()));
            },
          ),
          // Controls
          const PlayerControls(),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
