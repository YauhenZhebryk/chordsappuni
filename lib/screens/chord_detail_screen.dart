import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../models/chord.dart';
import '../widgets/chord_diagram.dart';

/// Detail screen showing chord diagram and play button.
class ChordDetailScreen extends StatefulWidget {
  final Chord chord;

  const ChordDetailScreen({super.key, required this.chord});

  @override
  State<ChordDetailScreen> createState() => _ChordDetailScreenState();
}

class _ChordDetailScreenState extends State<ChordDetailScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _playChord() async {
    if (_isPlaying) return; // Prevent overlapping plays
    
    setState(() => _isPlaying = true);
    
    try {
      await _audioPlayer.play(AssetSource(widget.chord.audioAsset.replaceFirst('assets/', '')));
      
      // Listen for completion
      _audioPlayer.onPlayerComplete.listen((_) {
        if (mounted) {
          setState(() => _isPlaying = false);
        }
      });
    } catch (e) {
      if (mounted) {
        setState(() => _isPlaying = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Audio file not found: ${widget.chord.audioAsset}'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          children: [
            Text(
              widget.chord.fullTypeName,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'STANDARD TUNING',
              style: TextStyle(
                color: Color(0xFF00E676), // Green subtitle
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.0,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          // Diagram Area
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.chord.fullTypeName,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ChordDiagram(chordName: widget.chord.diagramKey),
                ],
              ),
            ),
          ),
          
          // Play Button Area
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: FilledButton.icon(
                onPressed: _playChord,
                icon: Icon(
                  Icons.play_circle_filled,
                  color: Colors.black, // Icon color black as per button style usually or white? Screenshot play button is Green background, Black Text/Icon? 
                  // Screenshot 2 play button: Green background, Black Text "Play Sound", Black Icon.
                ), 
                label: Text(
                  _isPlaying ? 'Playing...' : 'Play Sound',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF00E676), // Green background
                  foregroundColor: Colors.black, // Splash/Highlight color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
