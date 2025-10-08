import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../models/song.dart';

class AudioProvider extends ChangeNotifier {
  final AudioPlayer _player = AudioPlayer();

  Song? _currentSong;
  List<Song> _playlist = [];
  bool _isPlaying = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  AudioProvider() {
    _initializeListeners();
  }

  // Getters
  Song? get currentSong => _currentSong;
  bool get isPlaying => _isPlaying;
  Duration get duration => _duration;
  Duration get position => _position;
  List<Song> get playlist => _playlist;

  Duration get totalDuration => _duration;
  Duration get currentPosition => _position;

  // Initialize listeners
  void _initializeListeners() {
    _player.durationStream.listen((d) {
      if (d != null) {
        _duration = d;
        notifyListeners();
      }
    });

    _player.positionStream.listen((p) {
      _position = p;
      notifyListeners();
    });

    _player.playerStateStream.listen((state) {
      _isPlaying = state.playing;
      notifyListeners();

      if (state.processingState == ProcessingState.completed) {
        playNext();
      }
    });
  }

  // Playlist setup
  Future<void> setPlaylist(List<Song> songs, {Song? startSong}) async {
    _playlist = songs;
    if (startSong != null) {
      await playSong(startSong);
    } else if (songs.isNotEmpty) {
      await playSong(songs.first);
    }
  }

  // Play a specific song
  Future<void> playSong(Song song) async {
    if (_currentSong == song && _isPlaying) return;

    _currentSong = song;
    try {
      await _player.setAsset(song.audioPath);
      await _player.play();
    } catch (e) {
      debugPrint("Error playing song: $e");
    }
    notifyListeners();
  }

  // Toggle play/pause
  Future<void> togglePlayPause() async {
    try {
      if (_isPlaying) {
        await _player.pause();
      } else {
        await _player.play();
      }
    } catch (e) {
      debugPrint("Error toggling play/pause: $e");
    }
  }

  // Stop playback
  Future<void> stop() async {
    await _player.stop();
    _isPlaying = false;
    notifyListeners();
  }

  // Seek to a position
  Future<void> seek(Duration position) async {
    await _player.seek(position);
    notifyListeners();
  }

  // Play next song
  Future<void> playNext() async {
    if (_playlist.isEmpty || _currentSong == null) return;

    final currentIndex = _playlist.indexOf(_currentSong!);
    final nextIndex = (currentIndex + 1) % _playlist.length;
    await playSong(_playlist[nextIndex]);
  }

  // Play previous song
  Future<void> playPrevious() async {
    if (_playlist.isEmpty || _currentSong == null) return;

    final currentIndex = _playlist.indexOf(_currentSong!);
    final prevIndex = (currentIndex - 1 + _playlist.length) % _playlist.length;
    await playSong(_playlist[prevIndex]);
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}
