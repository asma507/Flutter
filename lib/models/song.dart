class Song {
  final String title;
  final String artist;
  final String imageUrl;
  final String album;
  final int playCount;
  final String lyricsAssetPath;

  const Song({
    required this.title,
    required this.artist,
    required this.imageUrl,
    required this.album,
    required this.playCount,
    required this.lyricsAssetPath,
  });
}
