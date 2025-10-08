import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

class AudioPlayerPage extends StatefulWidget {
  final String songPath; // pass the asset path of the song

  const AudioPlayerPage({super.key, required this.songPath});

  @override
  State<AudioPlayerPage> createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  late AudioPlayer _player;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _init();
  }

  Future<void> _init() async {
    try {
      await _player.setAsset(widget.songPath); // load the song
    } catch (e) {
      print("Error loading song: $e");
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  // Combine position, buffered, and duration streams
  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        _player.positionStream,
        _player.bufferedPositionStream,
        _player.durationStream,
        (position, bufferedPosition, duration) =>
            PositionData(position, bufferedPosition, duration ?? Duration.zero),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Audio Player")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Play / Pause button
            StreamBuilder<PlayerState>(
              stream: _player.playerStateStream,
              builder: (context, snapshot) {
                final playerState = snapshot.data;
                final processingState =
                    playerState?.processingState ?? ProcessingState.idle;
                final playing = playerState?.playing ?? false;

                if (processingState == ProcessingState.loading ||
                    processingState == ProcessingState.buffering) {
                  return const CircularProgressIndicator();
                } else if (!playing) {
                  return IconButton(
                    iconSize: 64,
                    icon: const Icon(Icons.play_arrow),
                    onPressed: _player.play,
                  );
                } else {
                  return IconButton(
                    iconSize: 64,
                    icon: const Icon(Icons.pause),
                    onPressed: _player.pause,
                  );
                }
              },
            ),
            const SizedBox(height: 20),
            // Slider and time display
            StreamBuilder<PositionData>(
              stream: _positionDataStream,
              builder: (context, snapshot) {
                final positionData = snapshot.data ??
                    PositionData(Duration.zero, Duration.zero, Duration.zero);
                return Column(
                  children: [
                    Slider(
                      min: 0.0,
                      max: positionData.duration.inMilliseconds.toDouble(),
                      value: positionData.position.inMilliseconds
                          .clamp(0, positionData.duration.inMilliseconds)
                          .toDouble(),
                      onChanged: (value) {
                        _player.seek(Duration(milliseconds: value.toInt()));
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(_formatDuration(positionData.position)),
                        Text(_formatDuration(positionData.duration)),
                      ],
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),
            // Stop button
            ElevatedButton(
              onPressed: () => _player.stop(),
              child: const Text("Stop"),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}

// Helper class to combine streams
class PositionData {
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;

  PositionData(this.position, this.bufferedPosition, this.duration);
}

// -------------------- SONG LIST PAGE --------------------

class SongListPage extends StatelessWidget {
  const SongListPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> songs = [
      'assets/songs/saiyara.mp3',
      'assets/songs/Humsafar.mp3',
      'assets/songs/Tum Ho Tho.mp3',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Songs List")),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          // Extract the file name from path
          String songName = songs[index].split('/').last.replaceAll('.mp3', '');
          return ListTile(
            title: Text(songName),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AudioPlayerPage(songPath: songs[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
