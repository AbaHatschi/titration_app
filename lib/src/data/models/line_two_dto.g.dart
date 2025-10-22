// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'line_two_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LineTwoDto _$LineTwoDtoFromJson(Map<String, dynamic> json) => _LineTwoDto(
  id: (json['id'] as num).toInt(),
  pLye1: (json['pLye1'] as num).toDouble(),
  mLye1: (json['mLye1'] as num).toDouble(),
  lyeConcentration1: (json['lyeConcentration1'] as num).toDouble(),
  lyeSoda1: (json['lyeSoda1'] as num).toDouble(),
  timeStamp: DateTime.parse(json['timeStamp'] as String),
);

Map<String, dynamic> _$LineTwoDtoToJson(_LineTwoDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pLye1': instance.pLye1,
      'mLye1': instance.mLye1,
      'lyeConcentration1': instance.lyeConcentration1,
      'lyeSoda1': instance.lyeSoda1,
      'timeStamp': instance.timeStamp.toIso8601String(),
    };
