// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'line_one_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LineOneDto _$LineOneDtoFromJson(Map<String, dynamic> json) => _LineOneDto(
  id: (json['id'] as num).toInt(),
  pLye1: (json['pLye1'] as num).toDouble(),
  mLye1: (json['mLye1'] as num).toDouble(),
  pLye2: (json['pLye2'] as num).toDouble(),
  mLye2: (json['mLye2'] as num).toDouble(),
  lyeConcentration1: (json['lyeConcentration1'] as num).toDouble(),
  lyeSoda1: (json['lyeSoda1'] as num).toDouble(),
  lyeConcentration2: (json['lyeConcentration2'] as num).toDouble(),
  lyeSoda2: (json['lyeSoda2'] as num).toDouble(),
  timeStamp: DateTime.parse(json['timeStamp'] as String),
);

Map<String, dynamic> _$LineOneDtoToJson(_LineOneDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pLye1': instance.pLye1,
      'mLye1': instance.mLye1,
      'pLye2': instance.pLye2,
      'mLye2': instance.mLye2,
      'lyeConcentration1': instance.lyeConcentration1,
      'lyeSoda1': instance.lyeSoda1,
      'lyeConcentration2': instance.lyeConcentration2,
      'lyeSoda2': instance.lyeSoda2,
      'timeStamp': instance.timeStamp.toIso8601String(),
    };
