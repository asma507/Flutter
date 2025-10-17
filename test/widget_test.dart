import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lyrics_viewer_app/main.dart';
import 'package:lyrics_viewer_app/screens/home_screen.dart';
import 'package:lyrics_viewer_app/widgets/mini_player.dart';

void main() {
  testWidgets('Home screen renders with expected widgets',
      (WidgetTester tester) async {
    // Build the app and trigger a frame
    await tester.pumpWidget(const MyApp());

    // Verify that the AppBar title "Music" is present
    expect(find.text('Music'), findsOneWidget);

    // Verify that a DropdownButton (language selector) is present
    expect(find.byType(DropdownButton<String>), findsOneWidget);

    // Verify that the GridView (albums) is present
    expect(find.byType(GridView), findsOneWidget);

    // Verify that the MiniPlayer widget is present
    expect(find.byType(MiniPlayer), findsOneWidget);

    // Optionally, check for the BottomNavigationBar
    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });
}
