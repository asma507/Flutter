// lib/models/lyrics_line.dart

import 'package:flutter/foundation.dart';

/// A single line of lyrics with its timestamp.
class LyricsLine {
  /// The timestamp of the line in the song.
  final Duration timestamp;

  /// The text of the lyric line.
  final String text;

  /// Constructor
  LyricsLine({
    required this.timestamp,
    required this.text, required Duration time,
  });

  @override
  String toString() => '$timestamp: $text';
}
