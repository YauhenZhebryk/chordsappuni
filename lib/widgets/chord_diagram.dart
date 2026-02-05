import 'package:flutter/material.dart';

/// A custom widget that draws a guitar chord diagram on a fretboard.
/// 
/// This uses CustomPainter to draw the fretboard grid and finger positions.
class ChordDiagram extends StatelessWidget {
  final String chordName;
  
  const ChordDiagram({super.key, required this.chordName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 240,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: CustomPaint(
        painter: _ChordDiagramPainter(
          chordName: chordName,
          fingerColor: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}

class _ChordDiagramPainter extends CustomPainter {
  final String chordName;
  final Color fingerColor;

  _ChordDiagramPainter({required this.chordName, required this.fingerColor});

  // Chord fingering data: string -> (fret, finger) or null for open/muted
  // Strings are numbered 6 (low E) to 1 (high E)
  // Fret 0 = open, -1 = muted
  static const Map<String, List<int?>> chordFingerings = {
    // Major chords
    'C': [-1, 3, 2, 0, 1, 0],    // x32010
    'D': [-1, -1, 0, 2, 3, 2],   // xx0232
    'E': [0, 2, 2, 1, 0, 0],     // 022100
    'F': [1, 1, 2, 3, 3, 1],     // 133211 (barre)
    'G': [3, 2, 0, 0, 0, 3],     // 320003
    'A': [-1, 0, 2, 2, 2, 0],    // x02220
    'B': [-1, 2, 4, 4, 4, 2],    // x24442
    // Minor chords
    'Am': [-1, 0, 2, 2, 1, 0],   // x02210
    'Bm': [-1, 2, 4, 4, 3, 2],   // x24432
    'Cm': [-1, 3, 5, 5, 4, 3],   // x35543 (barre)
    'Dm': [-1, -1, 0, 2, 3, 1],  // xx0231
    'Em': [0, 2, 2, 0, 0, 0],    // 022000
    'Fm': [1, 1, 3, 3, 2, 1],    // 113321 (barre)
    'Gm': [3, 1, 0, 0, 3, 3],    // 310033 (simplified)
  };

  @override
  void paint(Canvas canvas, Size size) {
    final double padding = 30;
    final double fretboardWidth = size.width - (padding * 2);
    final double fretboardHeight = size.height - (padding * 2);
    final double stringSpacing = fretboardWidth / 5;
    final double fretSpacing = fretboardHeight / 5;

    // Draw fretboard background
    final fretboardRect = Rect.fromLTWH(
      padding, 
      padding, 
      fretboardWidth, 
      fretboardHeight,
    );
    final bgPaint = Paint()
      ..color = const Color(0xFFF5E6D3)
      ..style = PaintingStyle.fill;
    canvas.drawRect(fretboardRect, bgPaint);

    // Draw nut (top bar)
    final nutPaint = Paint()
      ..color = const Color(0xFF2D2D2D)
      ..style = PaintingStyle.fill;
    canvas.drawRect(
      Rect.fromLTWH(padding - 2, padding - 5, fretboardWidth + 4, 8),
      nutPaint,
    );

    // Draw frets
    final fretPaint = Paint()
      ..color = const Color(0xFF8B7355)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    
    for (int i = 0; i <= 5; i++) {
      final y = padding + (i * fretSpacing);
      canvas.drawLine(
        Offset(padding, y),
        Offset(size.width - padding, y),
        fretPaint,
      );
    }

    // Draw strings
    final stringPaint = Paint()
      ..color = const Color(0xFFBDBDBD)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    
    for (int i = 0; i < 6; i++) {
      final x = padding + (i * stringSpacing);
      canvas.drawLine(
        Offset(x, padding),
        Offset(x, size.height - padding),
        stringPaint,
      );
    }

    // Draw finger positions
    final fingering = chordFingerings[chordName] ?? [];
    final fingerPaint = Paint()
      ..color = fingerColor
      ..style = PaintingStyle.fill;
    
    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    for (int string = 0; string < fingering.length; string++) {
      final fret = fingering[string];
      final x = padding + (string * stringSpacing);
      
      if (fret == null) continue;
      
      if (fret == -1) {
        // Muted string - draw X above nut
        textPainter.text = TextSpan(
          text: 'X',
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        );
        textPainter.layout();
        textPainter.paint(
          canvas,
          Offset(x - textPainter.width / 2, padding - 20),
        );
      } else if (fret == 0) {
        // Open string - draw O above nut
        textPainter.text = TextSpan(
          text: 'O',
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        );
        textPainter.layout();
        textPainter.paint(
          canvas,
          Offset(x - textPainter.width / 2, padding - 20),
        );
      } else {
        // Finger position - draw filled circle
        final y = padding + ((fret - 0.5) * fretSpacing);
        canvas.drawCircle(Offset(x, y), 12, fingerPaint);
        
        // Draw fret number in circle
        textPainter.text = TextSpan(
          text: '$fret',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        );
        textPainter.layout();
        textPainter.paint(
          canvas,
          Offset(x - textPainter.width / 2, y - textPainter.height / 2),
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
