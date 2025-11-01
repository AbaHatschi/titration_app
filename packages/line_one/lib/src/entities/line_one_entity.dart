import 'package:core/core.dart';

/// Domain entity representing a KegLine.
/// Contains identity and validated value objects.
class LineOneEntity {
  LineOneEntity({
    required this.id,
    required this.mValueLyeOne,
    required this.pValueLyeOne,
    required this.mValueLyeTwo,
    required this.pValueLyeTwo,
    required this.concentrationLyeOne,
    required this.sodaLyeOne,
    required this.concentrationLyeTwo,
    required this.sodaLyeTwo,
    required this.timestamp,
  });

  final Id id;
  final MValueLyeOne mValueLyeOne;
  final PValueLyeOne pValueLyeOne;
  final MValueLyeTwo mValueLyeTwo;
  final PValueLyeTwo pValueLyeTwo;
  final ConcentrationLyeOne concentrationLyeOne;
  final SodaLyeOne sodaLyeOne;
  final ConcentrationLyeTwo concentrationLyeTwo;
  final SodaLyeTwo sodaLyeTwo;
  final Timestamp timestamp;

  @override
  String toString() =>
      'KegLineEntity(id: $id, concentrationLyeOne: $concentrationLyeOne, concentrationLyeTwo: $concentrationLyeTwo, mValueLyeOne: $mValueLyeOne, mValueLyeTwo: $mValueLyeTwo, pValueLyeOne: $pValueLyeOne, pValueLyeTwo: $pValueLyeTwo, timestamp: $timestamp)';
}
