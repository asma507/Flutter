class Song {
  final String title;
  final String artist;
  final String imagePath; // Album art (can be asset or network)
  final String audioPath; // Audio file path (asset)
  final String lyricsPath; // LRC file path (asset)

  const Song({
    required this.title,
    required this.artist,
    required this.imagePath,
    required this.audioPath,
    required this.lyricsPath,
  });

  // Optional: If any part of your app uses "imageUrl", map it automatically
  String get imageUrl => imagePath;

  // Demo songs (you can replace these with your actual data)
  static List<Song> demoSongs = [
    Song(
      title: 'Saiyara',
      artist: 'krish kapoor',
      imagePath:
          'https://glamsham.com/wp-content/uploads/2025/07/Saiyaara-Review_pic-courtesy-Youtube.jpg',
      audioPath: 'assets/audio/saiyara.mp3',
      lyricsPath: 'assets/lyrics/saiyara.lrc',
    ),
    Song(
      title: 'Humsafar',
      artist: 'krish kapoor',
      imagePath: 'https://i.ytimg.com/vi/BEHoMqlpYr8/oar2.jpg',
      audioPath: 'assets/audio/humsafar.mp3',
      lyricsPath: 'assets/lyrics/humsafar.lrc',
    ),
    Song(
      title: 'Tum Ho Tho',
      artist: 'krish kapoor',
      imagePath: 'https://i.ytimg.com/vi/BEHoMqlpYr8/oar2.jpg',
      audioPath: 'assets/audio/tum ho tho.mp3',
      lyricsPath: 'assets/lyrics/tum ho tho.lrc',
    ),
  ];
}
