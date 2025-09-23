import 'package:flutter/material.dart';

// A simple data model to hold a single line of lyric and its timestamp.
class LyricLine {
  final Duration timestamp;
  final String text;

  LyricLine({required this.timestamp, required this.text});
}

// A widget to display and auto-scroll synchronized lyrics.
class LyricsView extends StatefulWidget {
  final String lyrics;
  final Duration currentTime;

  const LyricsView({
    Key? key,
    required this.lyrics,
    required this.currentTime,
  }) : super(key: key);

  @override
  _LyricsViewState createState() => _LyricsViewState();
}

class _LyricsViewState extends State<LyricsView> {
  final ScrollController _scrollController = ScrollController();
  List<LyricLine> _parsedLyrics = [];
  int _currentLineIndex = 0;

  @override
  void initState() {
    super.initState();
    _parsedLyrics = _parseLyrics(widget.lyrics);
  }

  @override
  void didUpdateWidget(covariant LyricsView oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Find and scroll to the current lyric line when the time updates.
    _updateAndScrollToCurrentLine();
  }

  // Parses the raw LRC-formatted lyrics string into a list of LyricLine objects.
  List<LyricLine> _parseLyrics(String lyrics) {
    final List<LyricLine> lines = [];
    final RegExp timeRegex = RegExp(r'\[(\d{2}):(\d{2})\.(\d{2})\]');

    for (var line in lyrics.split('\n')) {
      final match = timeRegex.firstMatch(line);
      if (match != null) {
        final minutes = int.parse(match.group(1)!);
        final seconds = int.parse(match.group(2)!);
        final hundredths = int.parse(match.group(3)!);
        final timestamp = Duration(
          minutes: minutes,
          seconds: seconds,
          milliseconds: hundredths * 10,
        );
        final text = line.substring(match.end).trim();
        lines.add(LyricLine(timestamp: timestamp, text: text));
      }
    }
    return lines;
  }

  // Updates the current line index and scrolls the list view.
  void _updateAndScrollToCurrentLine() {
    int newIndex = 0;
    for (int i = 0; i < _parsedLyrics.length; i++) {
      if (widget.currentTime >= _parsedLyrics[i].timestamp) {
        newIndex = i;
      } else {
        break;
      }
    }

    if (_currentLineIndex != newIndex) {
      setState(() {
        _currentLineIndex = newIndex;
      });

      // Animate the list to scroll to the current line.
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _currentLineIndex *
              40.0, // Assuming each list item has a height of 40.0
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_parsedLyrics.isEmpty) {
      return const Center(child: Text('No lyrics available.'));
    }

    return ListView.builder(
      controller: _scrollController,
      itemCount: _parsedLyrics.length,
      itemBuilder: (context, index) {
        final isCurrentLine = index == _currentLineIndex;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            _parsedLyrics[index].text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: isCurrentLine ? FontWeight.bold : FontWeight.normal,
              color: isCurrentLine ? Colors.blue : Colors.grey,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
