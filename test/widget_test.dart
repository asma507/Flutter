import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lyrics_viewer_app/main.dart';

void main() {
  testWidgets('Home screen renders with expected titles',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // This will render MyApp, which in turn renders the HomeScreen.
    await tester.pumpWidget(const MyApp());

    // Verify that the "JioSaavn" title is present on the AppBar.
    expect(find.text('JioSaavn'), findsOneWidget);

    // Verify that the "Trending Now" section title is on the screen.
    expect(find.text('Trending Now'), findsOneWidget);

    // Verify that the Languages button is also visible.
    expect(find.text('Languages'), findsOneWidget);

    // You can also test for the presence of specific widget types.
    // For example, this checks that a horizontal ListView is present.
    expect(find.byType(ListView), findsWidgets);
  });
}
