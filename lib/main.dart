import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lyrics_viewer_app/screens/home_screen.dart';
import 'package:lyrics_viewer_app/providers/audio_provider.dart';

void main() {
  runApp(
    // The ChangeNotifierProvider makes AudioProvider available to the entire app.
    ChangeNotifierProvider(
      create: (context) => AudioProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lyrics Viewer App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
        ),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
