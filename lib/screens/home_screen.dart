import 'package:flutter/material.dart';
import 'package:lyrics_viewer_app/models/song.dart';
import 'package:lyrics_viewer_app/screens/album_screen.dart';
import 'package:lyrics_viewer_app/screens/login_screen.dart';
import 'package:lyrics_viewer_app/widgets/mini_player.dart';

// ✅ Trending data
final List<Map<String, dynamic>> trendingData = [
  {
    'imageUrl':
        'https://assets-in.bmscdn.com/discovery-catalog/events/et00447951-dczetyvwpe-landscape.jpg',
    'title': 'Saiyaara',
    'subtitle': 'fheem',
    'language': 'Hindi',
    'songs': [
      {
        'title': 'Saiyaara (Title Track)',
        'artist': 'Mohit Chauhan',
        'imageUrl':
            'https://glamsham.com/wp-content/uploads/2025/07/Saiyaara-Review_pic-courtesy-Youtube.jpg',
        'duration': '6:10',
        'lyricsAssetPath': 'assets/lyrics/saiyaara.lrc',
        'audioAssetPath': 'assets/audio/saiyaara.mp3',
      },
      {
        'title': 'Humsafar',
        'artist': 'Mohit Chauhan',
        'imageUrl': 'https://i.ytimg.com/vi/BEHoMqlpYr8/oar2.jpg',
        'duration': '5:22',
        'lyricsAssetPath': 'assets/lyrics/humsafar.lrc',
        'audioAssetPath': 'assets/audio/humsafar.mp3',
      },
      {
        'title': 'Tum Ho Tho',
        'artist': 'Mohit Chauhan',
        'imageUrl':
            'https://i.cdn.newsbytesapp.com/images/l96920250617143214.jpeg',
        'duration': '5:18',
        'lyricsAssetPath': 'assets/lyrics/tum_ho_tho.lrc',
        'audioAssetPath': 'assets/audio/tum_ho_tho.mp3',
      },
    ],
  },
  {
    'imageUrl':
        'https://cdn.gulte.com/wp-content/uploads/2023/12/Hi-Nanna-Movie-Review.jpg',
    'title': 'Hi Nanna',
    'subtitle': 'Hashem Abdul Wahab',
    'language': 'Telugu',
    'songs': [
      {
        'title': 'Na GaajuBomma',
        'artist': 'Nani',
        'imageUrl':
            'https://cdn.gulte.com/wp-content/uploads/2023/12/Hi-Nanna-Movie-Review.jpg',
        'duration': '03:40',
        'lyricsAssetPath': 'assets/lyrics/na_gaajubomma.lrc',
        'audioAssetPath': 'assets/audio/na_gaajubomma.mp3',
      },
      {
        'title': 'Enno Enno',
        'artist': 'Nani',
        'imageUrl':
            'https://english.idreampost.com/wp-content/uploads/2023/12/hi-nanna-review.jpg',
        'duration': '03:50',
        'lyricsAssetPath': 'assets/lyrics/enno_enno.lrc',
        'audioAssetPath': 'assets/audio/enno_enno.mp3',
      },
    ],
  },
  {
    'imageUrl':
        'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRx0wTDoneV8OuMM6hNfD7vfibB_jt6FcCL-u8H2DljlRXgGCoG',
    'title': 'RRR',
    'subtitle': 'Rahul Sipligunj',
    'language': 'Telugu',
    'songs': [
      {
        'title': 'Uyire',
        'artist': 'NTR & Ramcharan',
        'imageUrl':
            'https://cdn.gulte.com/wp-content/uploads/2023/12/Hi-Nanna-Movie-Review.jpg',
        'duration': '03:40',
        'lyricsAssetPath': 'assets/lyrics/uyire.lrc',
        'audioAssetPath': 'assets/audio/uyire.mp3',
      },
      {
        'title': 'Nattu Koothu',
        'artist': 'NTR & Ram charan',
        'imageUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQex5EK_c4P0vum1dMJdOrwqhVHt59e4IxbIw8WtgZwtE9pwYTqMSOZ94ugBzMRBY3_0Ak&usqp=CAU',
        'duration': '03:50',
        'lyricsAssetPath': 'assets/lyrics/nattu koothu.lrc',
        'audioAssetPath': 'assets/audio/nattu koothu.mp3',
      },
      {
        'title': 'Komma Uyyala',
        'artist': 'NTR & Ram charan',
        'imageUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ83Z_JqECrMycUJQwSBz3hmQLCEcVaNuI41zlDrU_exrL4CG4LareT248gLF8HcRtzvC4&usqp=CAU',
        'duration': '03:50',
        'lyricsAssetPath': 'assets/lyrics/komma uyyala.lrc',
        'audioAssetPath': 'assets/audio/komma uyyala.mp3',
      },
    ],
  },
  {
    'imageUrl':
        'https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/p11546593_p_v8_af.jpg',
    'title': 'Baahubali',
    'subtitle': 'M.M.Keeravani',
    'language': 'Telugu',
    'songs': [
      {
        'title': 'Dheevara',
        'artist': 'Prabhas',
        'imageUrl':
            'https://akm-img-a-in.tosshub.com/businesstoday/images/story/201507/baahubali-660_071315015253.jpg',
        'duration': '03:40',
        'lyricsAssetPath': 'assets/lyrics/dheevara.lrc',
        'audioAssetPath': 'assets/audio/dheevara.mp3',
      },
      {
        'title': 'Paccha Bottasi',
        'artist': 'Prabhas',
        'imageUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6tZqxY3c1b-1QhI6m1w5q0SCbEt26_3zxtrKi3pi2tJfsElidfU63kYu1_yEecPtsQzw&usqp=CAU',
        'duration': '03:50',
        'lyricsAssetPath': 'assets/lyrics/paccha bottasi.lrc',
        'audioAssetPath': 'assets/audio/paccha bottasi.mp3',
      },
      {
        'title': 'Manohari',
        'artist': 'Prabhas',
        'imageUrl':
            'https://preview.redd.it/do-you-want-manohari-song-in-baahubali-the-epic-v0-hvomi88x3wlf1.png?width=640&crop=smart&auto=webp&s=638458deeee77938706098a400e44574f5766e1a',
        'duration': '03:50',
        'lyricsAssetPath': 'assets/lyrics/manohari.lrc',
        'audioAssetPath': 'assets/audio/manohari.mp3',
      },
    ],
  },
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedLanguage = 'All';
  int _currentTabIndex = 0;
  bool _isSearching = false;
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Filter by language
    List<Map<String, dynamic>> filteredAlbums = _selectedLanguage == 'All'
        ? trendingData
        : trendingData
            .where((album) => album['language'] == _selectedLanguage)
            .toList();

    // Apply search filter
    if (_searchQuery.isNotEmpty) {
      filteredAlbums = filteredAlbums.where((album) {
        final title = album['title'].toString().toLowerCase();
        final subtitle = album['subtitle'].toString().toLowerCase();
        return title.contains(_searchQuery.toLowerCase()) ||
            subtitle.contains(_searchQuery.toLowerCase());
      }).toList();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF0F0F0),
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'MeraGana',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
        leadingWidth: 100,
        actions: [
          // Language Dropdown
          if (!_isSearching)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: DropdownButton<String>(
                value: _selectedLanguage,
                underline: const SizedBox(),
                icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                items: <String>['All', 'Telugu', 'Hindi', 'English']
                    .map((lang) => DropdownMenuItem(
                          value: lang,
                          child: Text(lang,
                              style: const TextStyle(color: Colors.black)),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedLanguage = value!;
                  });
                },
              ),
            ),

          // Search Field
          if (_isSearching)
            SizedBox(
              width: 200,
              child: TextField(
                controller: _searchController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              ),
            ),
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search,
                color: Colors.black),
            onPressed: () {
              setState(() {
                if (_isSearching) {
                  _searchQuery = '';
                  _searchController.clear();
                }
                _isSearching = !_isSearching;
              });
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 70),
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: filteredAlbums.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.65,
              ),
              itemBuilder: (context, index) {
                final album = filteredAlbums[index];
                final List<Song> songs = (album['songs'] as List)
                    .map((s) => Song(
                          title: s['title'],
                          artist: s['artist'],
                          imagePath: s['imageUrl'],
                          audioPath: s['audioAssetPath'],
                          lyricsPath: s['lyricsAssetPath'],
                        ))
                    .toList();

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AlbumScreen(
                          albumName: album['title'],
                          albumCover: album['imageUrl'],
                          songs: songs,
                        ),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          album['imageUrl'],
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 5),
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
                );
              },
            ),
          ),
          const Positioned(bottom: 0, left: 0, right: 0, child: MiniPlayer()),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentTabIndex,
        onTap: (index) {
          setState(() {
            _currentTabIndex = index;
            if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
              );
            } else if (index == 1) {
              _isSearching = true;
            } else {
              _isSearching = false;
              _searchQuery = '';
              _searchController.clear();
            }
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Login'),
        ],
      ),
    );
  }
}
