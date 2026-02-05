
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const GuitarChordsApp());
}

/// Guitar Chord Reference App
/// A minimalist app to learn basic guitar chords.
class GuitarChordsApp extends StatelessWidget {
  const GuitarChordsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guitar Chord Reference',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00E676), // Green accent from screenshot
          primary: const Color(0xFF00E676),
          secondary: const Color(0xFF00E676),
          surface: Colors.white,
          surfaceContainerHighest: const Color(0xFFFAFAFA), // Light grey for cards
          onSurface: const Color(0xFF1A1A1A), // Dark text
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        fontFamily: 'Poppins', // Or similar modern geometric sans
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          displayMedium: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          headlineSmall: TextStyle(fontWeight: FontWeight.w600, color: Colors.black54),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent, // Remove scroll tint
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
