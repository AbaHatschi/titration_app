import 'package:core/core.dart';

class LineTwoModel {
  LineTwoModel({
    required this.id,
    required this.mValueLyeOne,
    required this.pValueLyeOne,
    required this.concentrationLyeOne,
    required this.sodaLyeOne,
    required this.timestamp,
  });

  factory LineTwoModel.fromJson(Map<String, dynamic> json) => LineTwoModel(
    id: json['id'] as Id,
    mValueLyeOne: json['mValueLyeOne'] as MValueLyeOne,
    pValueLyeOne: json['pValueLyeOne'] as PValueLyeOne,
    concentrationLyeOne: json['concentrationLyeOne'] as ConcentrationLyeOne,
    sodaLyeOne: json['sodaLyeOne'] as SodaLyeOne,
    timestamp: json['timestamp'] as Timestamp,
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'mValueLyeOne': mValueLyeOne,
    'pValueLyeOne': pValueLyeOne,
    'concentrationLyeOne': concentrationLyeOne,
    'sodaLyeOne': sodaLyeOne,
    'timestamp': timestamp,
  };

  final Id id;
  final MValueLyeOne mValueLyeOne;
  final PValueLyeOne pValueLyeOne;
  final ConcentrationLyeOne concentrationLyeOne;
  final SodaLyeOne sodaLyeOne;
  final Timestamp timestamp;
}
