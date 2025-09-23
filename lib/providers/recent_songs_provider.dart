import 'package:flutter/foundation.dart';

class Song {
  final String title;
  final String artist;
  final String duration;
  final String? imageUrl;

  Song({
    required this.title,
    required this.artist,
    required this.duration,
    this.imageUrl,
  });
}

class RecentSongsProvider with ChangeNotifier {
  final List<Song> _recentSongs = [];

  List<Song> get recentSongs => List.unmodifiable(_recentSongs);

  void addSong(Song song) {
    // Remove if already exists to avoid duplicates
    _recentSongs
        .removeWhere((s) => s.title == song.title && s.artist == song.artist);
    // Add to front of list
    _recentSongs.insert(0, song);

    // Optionally limit size (e.g., last 10)
    if (_recentSongs.length > 10) {
      _recentSongs.removeLast();
    }
    notifyListeners();
  }
}
