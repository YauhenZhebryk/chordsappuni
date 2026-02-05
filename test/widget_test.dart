import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:chords/main.dart';
import 'package:chords/data/chords_data.dart';

void main() {
  testWidgets('Home screen displays chord cards', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const GuitarChordsApp());

    // Verify that all 7 chords are displayed
    for (final chord in chordsData) {
      expect(find.text(chord.name), findsOneWidget);
    }
  });

  testWidgets('Tapping chord navigates to detail screen', (WidgetTester tester) async {
    await tester.pumpWidget(const GuitarChordsApp());

    // Tap on the C chord card
    await tester.tap(find.text('C'));
    await tester.pumpAndSettle();

    // Verify we're on the detail screen
    expect(find.text('C Chord'), findsOneWidget);
    expect(find.text('Play Chord'), findsOneWidget);
  });

  testWidgets('Detail screen has back navigation', (WidgetTester tester) async {
    await tester.pumpWidget(const GuitarChordsApp());

    // Navigate to detail screen
    await tester.tap(find.text('D'));
    await tester.pumpAndSettle();

    // Tap back button
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();

    // Verify we're back on home screen
    expect(find.text('Guitar Chords'), findsOneWidget);
  });
}
