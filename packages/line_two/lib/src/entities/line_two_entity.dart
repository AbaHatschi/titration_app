import 'package:core/core.dart';

/// Domain entity representing a KegLine.
/// Contains identity and validated value objects.
class LineTwoEntity {
  LineTwoEntity({
    required this.id,
    required this.mValueLyeOne,
    required this.pValueLyeOne,
    required this.concentrationLyeOne,
    required this.sodaLyeOne,
    required this.timestamp,
  });

  final Id id;
  final MValueLyeOne mValueLyeOne;
  final PValueLyeOne pValueLyeOne;
  final ConcentrationLyeOne concentrationLyeOne;
  final SodaLyeOne sodaLyeOne;
  final Timestamp timestamp;

  @override
  String toString() =>
      'KegLineEntity(id: $id, concentrationLyeOne: $concentrationLyeOne, mValueLyeOne: $mValueLyeOne, pValueLyeOne: $pValueLyeOne, timestamp: $timestamp)';
}
