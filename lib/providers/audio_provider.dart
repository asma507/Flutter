import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lyrics_viewer_app/models/song.dart';

class AudioProvider with ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();
  Song? _currentSong;
  bool _isPlaying = false;
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;

  // Getters for accessing the state from other widgets
  Song? get currentSong => _currentSong;
  bool get isPlaying => _isPlaying;
  Duration get position => _position;
  Duration get duration => _duration;

  AudioProvider() {
    _initListeners();
  }

  void _initListeners() {
    // Listen to changes in the player's state (playing, paused, stopped)
    _audioPlayer.playerStateStream.listen((playerState) {
      _isPlaying = playerState.playing;
      notifyListeners();
    });

    // Listen to changes in the playback position
    _audioPlayer.positionStream.listen((newPosition) {
      _position = newPosition;
      notifyListeners();
    });

    // Listen to changes in the song's duration
    _audioPlayer.durationStream.listen((newDuration) {
      _duration = newDuration ?? Duration.zero;
      notifyListeners();
    });
  }

  // Method to play a new song
  Future<void> play(Song song) async {
    _currentSong = song;
    _position = Duration.zero;
    _duration = Duration.zero;
    notifyListeners();
    try {
      await _audioPlayer.setAsset(song.lyricsAssetPath
          .replaceAll('lyrics', 'audio')
          .replaceAll('.lrc', '.mp3'));
      _audioPlayer.play();
    } catch (e) {
      debugPrint("Error loading audio: $e");
    }
  }

  // Method to pause the current song
  void pause() {
    _audioPlayer.pause();
  }

  // Method to resume the paused song
  void resume() {
    _audioPlayer.play();
  }

  // Method to seek to a specific position
  void seek(Duration position) {
    _audioPlayer.seek(position);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
