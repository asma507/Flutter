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
      'assets/audio/saiyara.mp3',
      'assets/audio/Humsafar.mp3',
      'assets/audio/Tum Ho Tho.mp3',
      'assets/audio/barbaad.mp3',
      'assets/audio/na gaajubomma.mp3',
      'assets/audio/samayama.mp3',
      'assets/audio/ammaadi.mp3',
      'assets/audio/oodiyamma.mp3',
      'assets/audio/asalelaa.mp3',
      'assets/audio/adiga.mp3',
      'assets/audio/enno_enno.mp3',
      'assets/audio/idhe.mp3',
      'assets/audio/chedhunijam.mp3',
      'assets/audio/needhe needhe.mp3',
      'assets/audio/dosti.mp3',
      'assets/audio/naatu nattu.mp3',
      'assets/audio/komma uyyala.mp3',
      'assets/audio/raamam raaghavam.mp3',
      'assets/audio/komuram bheemudo.mp3',
      'assets/audio/dheevara.mp3',
      'assets/audio/paccha bottasi.mp3',
      'assets/audio/manohari.mp3',
      'assets/audio/nippulaa swasa ga.mp3',
      'assets/audio/mamatala talli.mp3',
      'assets/audio/nippulaa swasa ga.mp3',
      'assets/audio/inka edho.mp3',
      'assets/audio/hosahore.mp3',
      'assets/audio/neeve.mp3',
      'assets/audio/pranama.mp3',
      'assets/audio/bulle.mp3',
      'assets/audio/hua mei.mp3',
      'assets/audio/nee neeli.mp3',
      'assets/audio/neyveyrey.mp3',
      'assets/audio/nanna.mp3',
      'assets/audio/evarevaro.mp3',
      'assets/audio/kashmeeru.mp3',
      'assets/audio/nee neeli.mp3',
      'assets/audio/gira.mp3',
      'assets/audio/okalalla.mp3',
      'assets/audio/kadalalle.mp3',
      'assets/audio/yetupone.mp3',
      'assets/audio/opilla shubanalla.mp3',
      'assets/audio/nee chepakallu.mp3',
      'assets/audio/tauba.mp3',
      'assets/audio/aadevadanna.mp3',
      'assets/audio/sardhar.mp3',
      'assets/audio/meri.mp3',
      'assets/audio/sunn raha.mp3',
      'assets/audio/tum hi hoo.mp3',
      'assets/audio/chaduvu leduu.mp3',
      'assets/audio/rajagadiki.mp3',
      'assets/audio/hello ani.mp3',
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
