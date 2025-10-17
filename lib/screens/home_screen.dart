import 'package:flutter/material.dart';
import 'package:lyrics_viewer_app/models/song.dart';
import 'package:lyrics_viewer_app/screens/album_screen.dart';
import 'package:lyrics_viewer_app/screens/login_screen.dart';
import 'package:lyrics_viewer_app/widgets/mini_player.dart';

// ✅ Trending data
final List<Map<String, dynamic>> trendingData = [
  {
    'imageUrl': 'assets/images/saiyara1.jpeg',
    'title': 'Saiyaara',
    'subtitle': 'Krish Kapoor',
    'language': 'Hindi',
    'songs': [
      {
        'title': 'Saiyaara (Title Track)',
        'artist': 'Faheem Abdullah',
        'imageUrl': 'assets/images/saiyara1.jpeg',
        'duration': '6:10',
        'lyricsAssetPath': 'assets/lyrics/saiyara.lrc',
        'audioAssetPath': 'assets/audio/saiyara.mp3',
      },
      {
        'title': 'Humsafar',
        'artist': 'Faheem Abdullah',
        'imageUrl': 'assets/images/saiyara-2.jpg',
        'duration': '5:22',
        'lyricsAssetPath': 'assets/lyrics/humsafar.lrc',
        'audioAssetPath': 'assets/audio/humsafar.mp3',
      },
      {
        'title': 'Tum Ho Tho',
        'artist': 'Faheem Abdullah',
        'imageUrl': 'assets/images/saiyara-2.jpg',
        'duration': '5:18',
        'lyricsAssetPath': 'assets/lyrics/tum ho tho.lrc',
        'audioAssetPath': 'assets/audio/tum ho tho.mp3',
      },
      {
        'title': 'Tu paas hai',
        'artist': 'Faheem Abdullah',
        'imageUrl': 'assets/images/saiyara-2.jpg',
        'duration': '6:10',
        'lyricsAssetPath': 'assets/lyrics/tu paas hai.lrc',
        'audioAssetPath': 'assets/audio/tu paas hai.mp3',
      },
      {
        'title': 'Barbaad',
        'artist': 'Faheem Abdullah',
        'imageUrl': 'assets/images/saiyara1.jpeg',
        'duration': '6:10',
        'lyricsAssetPath': 'assets/lyrics/barbaad.lrc',
        'audioAssetPath': 'assets/audio/barbaad.mp3',
      },
    ],
  },
  {
    'imageUrl': 'assets/images/hinanna.jpg',
    'title': 'Hi Nanna',
    'subtitle': 'Nani & Mrunal Thakur',
    'language': 'Telugu',
    'songs': [
      {
        'title': 'Na GaajuBomma',
        'artist': 'Hesham Abdul Wahab',
        'imageUrl': 'assets/images/hinanna1.jpg',
        'duration': '4:24',
        'lyricsAssetPath': 'assets/lyrics/na gaajubomma.lrc',
        'audioAssetPath': 'assets/audio/na gaajubomma.mp3',
      },
      {
        'title': 'Samayama',
        'artist': 'Anurag Kulkarni & Sithara Krishnakumar',
        'imageUrl': 'assets/images/hinanna1.jpg',
        'duration': '3:22',
        'lyricsAssetPath': 'assets/lyrics/samayama.lrc',
        'audioAssetPath': 'assets/audio/samayama.mp3',
      },
      {
        'title': 'Ammaadi',
        'artist': 'Kaala Bhairava & Shakthisree Gopalan',
        'imageUrl': 'assets/images/hinanna3.jpg',
        'duration': '3:33',
        'lyricsAssetPath': 'assets/lyrics/ammaadi.lrc',
        'audioAssetPath': 'assets/audio/ammaadi.mp3',
      },
      {
        'title': 'Oodiyamma',
        'artist': 'Dhruv Vikram & Sruti Hassan & Chinmayi Sripaada',
        'imageUrl': 'assets/images/hinanna.jpg',
        'duration': '3:17',
        'lyricsAssetPath': 'assets/lyrics/oodiyamma .lrc',
        'audioAssetPath': 'assets/audio/oodiyamma.mp3',
      },
      {
        'title': 'Asalelaa',
        'artist': 'Chinmayi Sripada & Anurag Kulkarni',
        'imageUrl': 'assets/images/hinanna1.jpg',
        'duration': '03:50',
        'lyricsAssetPath': 'assets/lyrics/asalelaa.lrc',
        'audioAssetPath': 'assets/audio/asalelaa.mp3',
      },
      {
        'title': 'Adiga',
        'artist': 'Karthik',
        'imageUrl': 'assets/images/hinanna1.jpg',
        'duration': '03:50',
        'lyricsAssetPath': 'assets/lyrics/adiga.lrc',
        'audioAssetPath': 'assets/audio/adiga.mp3',
      },
      {
        'title': 'Enno Enno',
        'artist': 'Bhavana Isvi',
        'imageUrl': 'assets/images/hinanna3.jpg',
        'duration': '03:50',
        'lyricsAssetPath': 'assets/lyrics/enno_enno.lrc',
        'audioAssetPath': 'assets/audio/enno_enno.mp3',
      },
      {
        'title': 'Idhe Idhe',
        'artist': 'Hesham Abdul Wahab',
        'imageUrl': 'assets/images/hinanna.jpg',
        'duration': '03:50',
        'lyricsAssetPath': 'assets/lyrics/idhe.lrc',
        'audioAssetPath': 'assets/audio/idhe.mp3',
      },
      {
        'title': 'Chedhu Nijam',
        'artist': 'Geetha Madhuri',
        'imageUrl': 'assets/images/hinanna.jpg',
        'duration': '03:50',
        'lyricsAssetPath': 'assets/lyrics/chedhunijam.lrc',
        'audioAssetPath': 'assets/audio/chedhunijam.mp3',
      },
      {
        'title': 'Needhe Needhe',
        'artist': 'Aavani Malhar',
        'imageUrl': 'assets/images/hinanna.jpg',
        'duration': '03:50',
        'lyricsAssetPath': 'assets/lyrics/needhe needhe.lrc',
        'audioAssetPath': 'assets/audio/needhe needhe.mp3',
      },
    ],
  },
  {
    'imageUrl': 'assets/images/rrr.jpg',
    'title': 'RRR',
    'subtitle': 'N.T.R & Ramcharan & aliaBhat',
    'language': 'Telugu',
    'songs': [
      {
        'title': 'Dosti',
        'artist': 'Hemachandra',
        'imageUrl': 'assets/images/rrr.jpg',
        'duration': '5:04',
        'lyricsAssetPath': 'assets/lyrics/dosti.lrc',
        'audioAssetPath': 'assets/audio/dosti.mp3',
      },
      {
        'title': 'Naatu Naatu',
        'artist': 'Rahul Sipligunj & Kaala Bhairava',
        'imageUrl': 'assets/images/rrr1.jpg',
        'duration': '3:28',
        'lyricsAssetPath': 'assets/lyrics/naatu.lrc',
        'audioAssetPath': 'assets/audio/naatu nattu.mp3',
      },
      {
        'title': 'Komma Uyyala',
        'artist': 'Prakruthi Reddy',
        'imageUrl': 'assets/images/rrr1.jpg',
        'duration': '2:49',
        'lyricsAssetPath': 'assets/lyrics/komma uyyala.lrc',
        'audioAssetPath': 'assets/audio/komma uyyala.mp3',
      },
      {
        'title': 'Raamam Raaghavam',
        'artist': 'Vijay Prakash',
        'imageUrl': 'assets/images/rrr1.jpg',
        'duration': '03:50',
        'lyricsAssetPath': 'assets/lyrics/raamam raaghavam.lrc',
        'audioAssetPath': 'assets/audio/raamam raaghavam.mp3',
      },
      {
        'title': 'Komuram Bheemudo',
        'artist': 'Kaala Bhairava',
        'imageUrl': 'assets/images/rrr.jpg',
        'duration': '03:50',
        'lyricsAssetPath': 'assets/lyrics/komuram bheemudo.lrc',
        'audioAssetPath': 'assets/audio/komuram bheemudo.mp3',
      },
    ],
  },
  {
    'imageUrl': 'assets/images/bhahubali.jpg',
    'title': 'Baahubali',
    'subtitle': 'Prabhas & Tamanna',
    'language': 'Telugu',
    'songs': [
      {
        'title': 'Dheevara',
        'artist': 'Ramya Behara, Deepu',
        'imageUrl': 'assets/images/bhahubali1.jpg',
        'duration': '03:40',
        'lyricsAssetPath': 'assets/lyrics/dheevara.lrc',
        'audioAssetPath': 'assets/audio/dheevara.mp3',
      },
      {
        'title': 'Paccha Bottasi',
        'artist': 'Karthik, Damini',
        'imageUrl': 'assets/images/bhahubali2.jpeg',
        'duration': '03:50',
        'lyricsAssetPath': 'assets/lyrics/paccha bottasi.lrc',
        'audioAssetPath': 'assets/audio/paccha bottasi.mp3',
      },
      {
        'title': 'Manohari',
        'artist': ' Mohana Bhogaraju, Revanth',
        'imageUrl': 'assets/images/bhahubali1.jpg',
        'duration': '03:50',
        'lyricsAssetPath': 'assets/lyrics/manohari.lrc',
        'audioAssetPath': 'assets/audio/manohari.mp3',
      },
      {
        'title': 'Nippulaa Swasa Ga',
        'artist': 'Prabhas',
        'imageUrl': 'assets/images/bhahubali.jpg',
        'duration': '03:50',
        'lyricsAssetPath': 'assets/lyrics/nippulaa swasa ga.lrc',
        'audioAssetPath': 'assets/audio/nippulaa swasa ga.mp3',
      },
      {
        'title': 'Mamatala Talli',
        'artist': ' Yamini',
        'imageUrl': 'assets/images/bhahubali.jpg',
        'duration': '03:50',
        'lyricsAssetPath': 'assets/lyrics/mamatala talli.lrc',
        'audioAssetPath': 'assets/audio/mamatala talli.mp3',
      },
      {
        'title': 'Nippulaa Swasa Ga',
        'artist': 'M.M. Keeravaani',
        'imageUrl': 'assets/images/bhahubali.jpg',
        'duration': '03:50',
        'lyricsAssetPath': 'assets/lyrics/nippulaa swasa ga.lrc',
        'audioAssetPath': 'assets/audio/nippulaa swasa ga.mp3',
      },
    ],
  },
  {
    'imageUrl': 'assets/images/darling.jpg',
    'title': 'Darling',
    'subtitle': 'Prabhas & Kajal',
    'language': 'Telugu',
    'songs': [
      {
        'title': 'inka edho',
        'artist': 'Suraj & Prashantini',
        'imageUrl': 'assets/images/darling1.jpg',
        'duration': '5:16',
        'lyricsAssetPath': 'assets/lyrics/inka edho.lrc',
        'audioAssetPath': 'assets/audio/inka edho.mp3',
      },
      {
        'title': 'Hosahore',
        'artist': 'K.K & Leslie',
        'imageUrl': 'assets/images/darling1.jpg',
        'duration': '3:52',
        'lyricsAssetPath': 'assets/lyrics/hosahore.lrc',
        'audioAssetPath': 'assets/audio/hosahore.mp3',
      },
      {
        'title': 'Neeve',
        'artist': 'G.V. Prakash Kumar',
        'imageUrl': 'assets/images/darling1.jpg',
        'duration': '4:45',
        'lyricsAssetPath': 'assets/lyrics/neeve.lrc',
        'audioAssetPath': 'assets/audio/neeve.mp3',
      },
      {
        'title': 'Pranama',
        'artist': 'Prabhas & Kajal',
        'imageUrl': 'assets/images/darling1.jpg',
        'duration': '6:10',
        'lyricsAssetPath': 'assets/lyrics/pranama.lrc',
        'audioAssetPath': 'assets/audio/pranama.mp3',
      },
      {
        'title': 'Bulle',
        'artist': 'Mallikarjun, Priya Hemesh',
        'imageUrl': 'assets/images/darling1.jpg',
        'duration': '6:10',
        'lyricsAssetPath': 'assets/lyrics/bulle.lrc',
        'audioAssetPath': 'assets/audio/bulle.mp3',
      },
    ],
  },
  {
    'imageUrl': 'assets/images/animal.jpg',
    'title': 'Animal',
    'subtitle': 'Ranbir Kapoor & Rashmika Mandanna',
    'language': 'Telugu',
    'songs': [
      {
        'title': 'Hua mei',
        'artist': 'Raghav Chaitanya',
        'imageUrl': 'assets/images/animal1.jpg',
        'duration': '4:37',
        'lyricsAssetPath': 'assets/lyrics/hua mei.lrc',
        'audioAssetPath': 'assets/audio/hua mei.mp3',
      },
      {
        'title': 'Ammaiyi',
        'artist': 'Raghav Chaitanya',
        'imageUrl': 'assets/images/animal1.jpg',
        'duration': '6:10',
        'lyricsAssetPath': 'assets/lyrics/nee neeli.lrc',
        'audioAssetPath': 'assets/audio/nee neeli.mp3',
      },
      {
        'title': 'Ney Veyrey',
        'artist': 'Raghav Chaitanya',
        'imageUrl': 'assets/images/animal1.jpg',
        'duration': '6:10',
        'lyricsAssetPath': 'assets/lyrics/neyveyrey.lrc',
        'audioAssetPath': 'assets/audio/neyveyrey.mp3',
      },
      {
        'title': 'Nanna Nuv Naa Pranam',
        'artist': 'Raghav Chaitanya',
        'imageUrl': 'assets/images/animal1.jpg',
        'duration': '5:22',
        'lyricsAssetPath': 'assets/lyrics/nanna.lrc',
        'audioAssetPath': 'assets/audio/nanna.mp3',
      },
      {
        'title': 'Evarevaro',
        'artist': 'Raghav Chaitanya',
        'imageUrl': 'assets/images/animal1.jpg',
        'duration': '5:18',
        'lyricsAssetPath': 'assets/lyrics/evarevaro.lrc',
        'audioAssetPath': 'assets/audio/evarevaro.mp3',
      },
      {
        'title': 'Kashmeeru',
        'artist': 'Raghav Chaitanya',
        'imageUrl': 'assets/images/animal1.jpg',
        'duration': '6:10',
        'lyricsAssetPath': 'assets/lyrics/kashmeeru.lrc',
        'audioAssetPath': 'assets/audio/kashmeeru.mp3',
      },
    ],
  },
  {
    'imageUrl': 'assets/images/dearcomrade1.jpeg',
    'title': 'Dear Comrade',
    'subtitle': 'Vijay Devarakonda & Rashmika',
    'language': 'Telugu',
    'songs': [
      {
        'title': 'Nee Neeli Kannullona',
        'artist': 'Gowtham bharadwaj V',
        'imageUrl': 'assets/images/dearcomrade.jpeg',
        'duration': '2:27',
        'lyricsAssetPath': 'assets/lyrics/nee neeli.lrc',
        'audioAssetPath': 'assets/audio/nee neeli.mp3',
      },
      {
        'title': 'Gira Gira Gira',
        'artist': 'Gowtham Bharadwaj & Yamini Ghantasala, Justin Prabhakaran',
        'imageUrl': 'assets/images/dearcomrade.jpeg',
        'duration': '4:42',
        'lyricsAssetPath': 'assets/lyrics/gira.lrc',
        'audioAssetPath': 'assets/audio/gira.mp3',
      },
      {
        'title': 'O Kalala Kathala',
        'artist': 'Sathya Praksh, Chinmayi Sripada',
        'imageUrl': 'assets/images/dearcomrade.jpeg',
        'duration': '5:22',
        'lyricsAssetPath': 'assets/lyrics/okalalla.lrc',
        'audioAssetPath': 'assets/audio/okalalla.mp3',
      },
      {
        'title': 'Kadalalle',
        'artist': 'Sid Sriram, Aishwarya Ravichan',
        'imageUrl': 'assets/images/dearcomrade.jpeg',
        'duration': '5:02',
        'lyricsAssetPath': 'assets/lyrics/kadalalle.lrc',
        'audioAssetPath': 'assets/audio/kadalalle.mp3',
      },
      {
        'title': 'Yetu Pone',
        'artist': 'Kaala Bhairava',
        'imageUrl': 'assets/images/dearcomrade.jpeg',
        'duration': '6:10',
        'lyricsAssetPath': 'assets/lyrics/yetupone.lrc',
        'audioAssetPath': 'assets/audio/yetupone.mp3',
      },
    ],
  },
  {
    'imageUrl': 'assets/images/sardhar3.jpg',
    'title': 'Sardaar Gabbar Singh',
    'subtitle': 'pavan kalyan & kajal',
    'language': 'Telugu',
    'songs': [
      {
        'title': 'O Pilla Shubanalla',
        'artist': 'Vijay Prakash, Shreya Ghoshal',
        'imageUrl': 'assets/images/sardhar2.jpg',
        'duration': '4:32',
        'lyricsAssetPath': 'assets/lyrics/opilla shubanalla.lrc',
        'audioAssetPath': 'assets/audio/opilla shubanalla.mp3',
      },
      {
        'title': 'Nee Chepakallu',
        'artist': 'Sagar, Chinmayi Sripada',
        'imageUrl': 'assets/images/sardhar2.jpg',
        'duration': '4:22',
        'lyricsAssetPath': 'assets/lyrics/nee chepakallu.lrc',
        'audioAssetPath': 'assets/audio/nee chepakallu.mp3',
      },
      {
        'title': 'Tauba Tauba',
        'artist': 'M.M.Manasi, Nakash Aziz',
        'imageUrl': 'assets/images/sardhar2.jpg',
        'duration': '4:25',
        'lyricsAssetPath': 'assets/lyrics/tauba.lrc',
        'audioAssetPath': 'assets/audio/tauba.mp3',
      },
      {
        'title': 'Aadevadanna Eedevadanna',
        'artist': 'M.L.R.Karthikeyan',
        'imageUrl': 'assets/images/sardhar2.jpg',
        'duration': '03:50',
        'lyricsAssetPath': 'assets/lyrics/aadevadanna.lrc',
        'audioAssetPath': 'assets/audio/aadevadanna.mp3',
      },
      {
        'title': 'Sardhar',
        'artist': 'Benny Dayal',
        'imageUrl': 'assets/images/sardhar2.jpg',
        'duration': '03:50',
        'lyricsAssetPath': 'assets/lyrics/sardhar.lrc',
        'audioAssetPath': 'assets/audio/sardhar.mp3',
      },
    ],
  },
  {
    'imageUrl': 'assets/images/aashiqui.jpeg',
    'title': 'Aashiqui 2',
    'subtitle': 'Aditya Roy Kapur,Shraddha Kapoor',
    'language': 'Hindi',
    'songs': [
      {
        'title': 'Meri Ashiqui',
        'artist': 'Palak Muchhal,Arijit Singh',
        'imageUrl': 'assets/images/aashiqui.jpeg',
        'duration': '03:40',
        'lyricsAssetPath': 'assets/lyrics/meri.lrc',
        'audioAssetPath': 'assets/audio/meri.mp3',
      },
      {
        'title': 'Sunn Raha hai',
        'artist': 'aditya Roy kapur',
        'imageUrl': 'assets/images/aashiqui.jpeg',
        'duration': '03:50',
        'lyricsAssetPath': 'assets/lyrics/sunn raha.lrc',
        'audioAssetPath': 'assets/audio/sunn raha.mp3',
      },
      {
        'title': 'Tum Hi Hoo',
        'artist': 'Aditya Roy kapur',
        'imageUrl': 'assets/images/aashiqui.jpeg',
        'duration': '03:40',
        'lyricsAssetPath': 'assets/lyrics/tum hi hoo.lrc',
        'audioAssetPath': 'assets/audio/tum hi hoo.mp3',
      },
    ],
  },
  {
    'imageUrl': 'assets/images/littlehearts.jpg',
    'title': 'Little Hearts',
    'subtitle': 'Arijit Singh & Ankit Tiwari',
    'language': 'Telugu',
    'songs': [
      {
        'title': 'Chaduvu leduu',
        'artist': 'Sinjith Yerramilli',
        'imageUrl': 'assets/images/littlehearts.jpg',
        'duration': '03:40',
        'lyricsAssetPath': 'assets/lyrics/chaduvu leduu.lrc',
        'audioAssetPath': 'assets/audio/chaduvu leduu.mp3',
      },
      {
        'title': 'Rajagadiki',
        'artist': 'Mouli & Shivani Nagaram',
        'imageUrl': 'assets/images/rajagadiki.jpeg',
        'duration': '03:50',
        'lyricsAssetPath': 'assets/lyrics/rajagadiki.lrc',
        'audioAssetPath': 'assets/audio/rajagadiki.mp3',
      },
      {
        'title': 'Hello ani',
        'artist': 'Mouli & Shivani Nagaram',
        'imageUrl': 'assets/images/rajagadiki.jpeg',
        'duration': '03:50',
        'lyricsAssetPath': 'assets/lyrics/hello ani.lrc',
        'audioAssetPath': 'assets/audio/hello ani.mp3',
      },
    ],
  },
];

// Your trendingData list remains unchanged (not included here for brevity)

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
            'Music',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color.fromARGB(255, 2, 2, 2),
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
      body: Column(
        children: [
          Expanded(
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
                        child: Image.asset(
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
                        style: const TextStyle(
                            color: Color.fromARGB(255, 58, 55, 55)),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const MiniPlayer(), // now appears fixed below the scrollable GridView
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
