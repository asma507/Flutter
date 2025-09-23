import 'package:flutter/material.dart';
import 'package:lyrics_viewer_app/models/song.dart';
import 'package:lyrics_viewer_app/screens/album_screen.dart';
import 'package:lyrics_viewer_app/widgets/mini_player.dart';

// Example album data
final List<Map<String, dynamic>> trendingData = [
  {
    'imageUrl':
        'https://assets-in.bmscdn.com/iedb/movies/images/mobile/thumbnail/xlarge/saiyaara-et00447951-1752737895.jpg',
    'title': 'Saiyaara',
    'subtitle': 'Fheem',
    'songs': [
      {
        'title': 'Saiyaara (Title Track)',
        'artist': 'Mohit Chauhan',
        'imageUrl':
            'https://assets-in.bmscdn.com/iedb/movies/images/mobile/thumbnail/xlarge/saiyaara-et00447951-1752737895.jpg',
        'duration': '03:50'
      },
      {
        'title': 'Humsafar',
        'artist': 'Mohit Chauhan',
        'imageUrl':
            'https://i.ytimg.com/vi/BEHoMqlpYr8/oar2.jpg?sqp=-oaymwEYCJUDENAFSFqQAgHyq4qpAwcIARUAAIhC&rs=AOn4CLC4JrW1wNFGFIbvYgbTsq8u5rnTZw',
        'duration': '03:50'
      },
      {
        'title': 'Tum Ho Tho',
        'artist': 'Mohit Chauhan',
        'imageUrl':
            'https://c.ndtvimg.com/2025-07/9ln27jac_saiyaara_625x300_27_July_25.jpg?im=FeatureCrop,algorithm=dnn,width=1200,height=738',
        'duration': '03:50'
      },
      {
        'title': 'Tum Hi Ho',
        'artist': 'Arijit Singh',
        'imageUrl':
            'https://staticimg.amarujala.com/assets/images/2025/06/24/sayara_4f8edf95d4afeae4b25f1afc30304933.jpeg',
        'duration': '04:20'
      },
      {
        'title': 'Dhun',
        'artist': 'Arijit Singh',
        'imageUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLVDKofpNWIBXZMFjKO95JEIwUFmj3patuRksiuxpuam4aKXOjyTz4KwHnBnaICYuw3g4&usqp=CAU',
        'duration': '04:20'
      },
    ],
  },
  {
    'imageUrl':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZFqQV5YCzMLCR2B2kDZsI7Dh0Iv3xJFEobHl5XAmKiN1X8tifiR3nkDtlcvFsFEDgfjg&usqp=CAU',
    'title': 'Deewaniyat',
    'subtitle': 'Vishal Mishra',
    'songs': [
      {
        'title': 'Deewaniyat',
        'artist': 'Vishal Mishra',
        'imageUrl': 'https://i.ibb.co/hKzV75j/trending2.png',
        'duration': '03:40'
      },
    ],
  },
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF0F0F0),
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'MeraGana ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
        leadingWidth: 100,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextButton.icon(
              onPressed: () {},
              icon: const Text(
                'Languages',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
              label: const Icon(Icons.arrow_drop_down, color: Colors.black),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    'Trending Now',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                _buildHorizontalList(trendingData),
                const SizedBox(height: 20),
                _buildHorizontalList(trendingData),
              ],
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: MiniPlayer(),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildHorizontalList(List<Map<String, dynamic>> data) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          final album = data[index];
          return GestureDetector(
            onTap: () {
              final List<Song> songs = (album['songs'] as List)
                  .map((s) => Song(
                        title: s['title'],
                        artist: s['artist'],
                        imageUrl: s['imageUrl'],
                        album: album['title'],
                        playCount: 123456,
                        lyricsAssetPath: 'assets/lyrics/demo.lrc',
                      ))
                  .toList();

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AlbumScreen(
                    albumName: album['title'],
                    albumCover: album['imageUrl'],
                    songs: songs,
                  ),
                ),
              );
            },
            child: Container(
              width: 150,
              margin: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      album['imageUrl'],
                      fit: BoxFit.cover,
                      height: 120,
                      width: 150,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    album['title'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    album['subtitle'],
                    style: const TextStyle(color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'Browse',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Login',
        ),
      ],
    );
  }
}
