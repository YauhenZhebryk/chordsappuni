/// Chord type enumeration
enum ChordType {
  major,
  minor,
}

/// Represents a guitar chord with its name and asset paths.
class Chord {
  final String name;
  final ChordType type;
  final String diagramAsset;
  final String audioAsset;

  const Chord({
    required this.name,
    this.type = ChordType.major,
    required this.diagramAsset,
    required this.audioAsset,
  });

  /// Returns the display name (e.g., "Am" for A minor, "C" for C major)
  String get displayName => type == ChordType.minor ? '${name}m' : name;

  /// Returns the full type name (e.g., "A Minor" or "C Major")
  String get fullTypeName => type == ChordType.minor ? '$name Minor' : '$name Major';

  /// Returns the chord key for diagram lookup
  String get diagramKey => type == ChordType.minor ? '${name}m' : name;
}
