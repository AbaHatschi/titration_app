import 'package:freezed_annotation/freezed_annotation.dart';

part 'line_one_entity.freezed.dart';
part 'line_one_entity.g.dart';

@freezed
abstract class LineOneEntity with _$LineOneEntity {
  factory LineOneEntity({
    required int id,
    required double pLye1,
    required double mLye1,
    required double pLye2,
    required double mLye2,
    required double lyeConcentration1,
    required double lyeSoda1,
    required double lyeConcentration2,
    required double lyeSoda2,
    required DateTime timeStamp,
  }) = _LineOneEntity;

  factory LineOneEntity.fromJson(Map<String, dynamic> json) =>
      _$LineOneEntityFromJson(json);
}
