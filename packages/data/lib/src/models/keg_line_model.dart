import 'package:core/core.dart';

class KegLineModel {
  KegLineModel({
    required this.id,
    required this.mValueLyeOne,
    required this.pValueLyeOne,
    required this.mValueLyeTwo,
    required this.pValueLyeTwo,
    required this.mValueAcid,
    required this.concentrationLyeOne,
    required this.sodaLyeOne,
    required this.concentrationLyeTwo,
    required this.sodaLyeTwo,
    required this.concentrationAcid,
    required this.timestamp,
  });

  factory KegLineModel.fromJson(Map<String, dynamic> json) => KegLineModel(
    id: json['id'] as Id,
    mValueLyeOne: json['mValueLyeOne'] as MValueLyeOne,
    pValueLyeOne: json['pValueLyeOne'] as PValueLyeOne,
    mValueLyeTwo: json['mValueLyeTwo'] as MValueLyeTwo,
    pValueLyeTwo: json['pValueLyeTwo'] as PValueLyeTwo,
    mValueAcid: json['mValueAcid'] as MValueAcid,
    concentrationLyeOne: json['concentrationLyeOne'] as ConcentrationLyeOne,
    sodaLyeOne: json['sodaLyeOne'] as SodaLyeOne,
    concentrationLyeTwo: json['concentrationLyeTwo'] as ConcentrationLyeTwo,
    sodaLyeTwo: json['sodaLyeTwo'] as SodaLyeTwo,
    concentrationAcid: json['concentrationAcid'] as ConcentrationAcid,
    timestamp: json['timestamp'] as Timestamp,
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'mValueLyeOne': mValueLyeOne,
    'pValueLyeOne': pValueLyeOne,
    'mValueLyeTwo': mValueLyeTwo,
    'pValueLyeTwo': pValueLyeTwo,
    'mValueAcid': mValueAcid,
    'concentrationLyeOne': concentrationLyeOne,
    'sodaLyeOne': sodaLyeOne,
    'concentrationLyeTwo': concentrationLyeTwo,
    'sodaLyeTwo': sodaLyeTwo,
    'concentrationAcid': concentrationAcid,
    'timestamp': timestamp,
  };

  final Id id;
  final MValueLyeOne mValueLyeOne;
  final PValueLyeOne pValueLyeOne;
  final MValueLyeTwo mValueLyeTwo;
  final PValueLyeTwo pValueLyeTwo;
  final MValueAcid mValueAcid;
  final ConcentrationLyeOne concentrationLyeOne;
  final SodaLyeOne sodaLyeOne;
  final ConcentrationLyeTwo concentrationLyeTwo;
  final SodaLyeTwo sodaLyeTwo;
  final ConcentrationAcid concentrationAcid;
  final Timestamp timestamp;
}
