import 'package:core/core.dart';

class LineOneModel {
  LineOneModel({
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

  factory LineOneModel.fromJson(Map<String, dynamic> json) => LineOneModel(
    id: json['id'] as Id,
    mValueLyeOne: json['mValueLyeOne'] as MValueLyeOne,
    pValueLyeOne: json['pValueLyeOne'] as PValueLyeOne,
    mValueLyeTwo: json['mValueLyeTwo'] as MValueLyeTwo,
    pValueLyeTwo: json['pValueLyeTwo'] as PValueLyeTwo,
    concentrationLyeOne: json['concentrationLyeOne'] as ConcentrationLyeOne,
    sodaLyeOne: json['sodaLyeOne'] as SodaLyeOne,
    concentrationLyeTwo: json['concentrationLyeTwo'] as ConcentrationLyeTwo,
    sodaLyeTwo: json['sodaLyeTwo'] as SodaLyeTwo,
    timestamp: json['timestamp'] as Timestamp,
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'mValueLyeOne': mValueLyeOne,
    'pValueLyeOne': pValueLyeOne,
    'mValueLyeTwo': mValueLyeTwo,
    'pValueLyeTwo': pValueLyeTwo,
    'concentrationLyeOne': concentrationLyeOne,
    'sodaLyeOne': sodaLyeOne,
    'concentrationLyeTwo': concentrationLyeTwo,
    'sodaLyeTwo': sodaLyeTwo,
    'timestamp': timestamp,
  };

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
}
