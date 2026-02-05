import '../models/chord.dart';

/// List of basic guitar chords with their asset paths.
const List<Chord> chordsData = [
  // Major chords
  Chord(
    name: 'C',
    type: ChordType.major,
    diagramAsset: 'assets/images/c_chord.png',
    audioAsset: 'assets/audio/c_chord.mp3',
  ),
  Chord(
    name: 'D',
    type: ChordType.major,
    diagramAsset: 'assets/images/d_chord.png',
    audioAsset: 'assets/audio/d_chord.mp3',
  ),
  Chord(
    name: 'E',
    type: ChordType.major,
    diagramAsset: 'assets/images/e_chord.png',
    audioAsset: 'assets/audio/e_chord.mp3',
  ),
  Chord(
    name: 'F',
    type: ChordType.major,
    diagramAsset: 'assets/images/f_chord.png',
    audioAsset: 'assets/audio/f_chord.mp3',
  ),
  Chord(
    name: 'G',
    type: ChordType.major,
    diagramAsset: 'assets/images/g_chord.png',
    audioAsset: 'assets/audio/g_chord.mp3',
  ),
  Chord(
    name: 'A',
    type: ChordType.major,
    diagramAsset: 'assets/images/a_chord.png',
    audioAsset: 'assets/audio/a_chord.wav',
  ),
  Chord(
    name: 'B',
    type: ChordType.major,
    diagramAsset: 'assets/images/b_chord.png',
    audioAsset: 'assets/audio/b_chord.wav',
  ),
  // Minor chords
  Chord(
    name: 'A',
    type: ChordType.minor,
    diagramAsset: 'assets/images/am_chord.png',
    audioAsset: 'assets/audio/am_chord.wav',
  ),
  Chord(
    name: 'B',
    type: ChordType.minor,
    diagramAsset: 'assets/images/bm_chord.png',
    audioAsset: 'assets/audio/bm_chord.mp3',
  ),
  Chord(
    name: 'C',
    type: ChordType.minor,
    diagramAsset: 'assets/images/cm_chord.png',
    audioAsset: 'assets/audio/cm_chord.mp3',
  ),
  Chord(
    name: 'D',
    type: ChordType.minor,
    diagramAsset: 'assets/images/dm_chord.png',
    audioAsset: 'assets/audio/dm_chord.mp3',
  ),
  Chord(
    name: 'E',
    type: ChordType.minor,
    diagramAsset: 'assets/images/em_chord.png',
    audioAsset: 'assets/audio/em_chord.mp3',
  ),
  Chord(
    name: 'F',
    type: ChordType.minor,
    diagramAsset: 'assets/images/fm_chord.png',
    audioAsset: 'assets/audio/fm_chord.mp3',
  ),
  Chord(
    name: 'G',
    type: ChordType.minor,
    diagramAsset: 'assets/images/gm_chord.png',
    audioAsset: 'assets/audio/gm_chord.mp3',
  ),
];
