import 'package:freezed_annotation/freezed_annotation.dart';

part 'keg_line_entity.freezed.dart';
part 'keg_line_entity.g.dart';

@freezed
abstract class KegLineEntity with _$KegLineEntity {
  factory KegLineEntity({
    required int id,
    required double pLye1,
    required double mLye1,
    required double pLye2,
    required double mLye2,
    required double mAcid,
    required double lyeConcentration1,
    required double lyeSoda1,
    required double lyeConcentration2,
    required double lyeSoda2,
    required double acidConcentration,
    required DateTime timeStamp,
  }) = _KegLineEntity;

  factory KegLineEntity.fromJson(Map<String, dynamic> json) =>
      _$KegLineEntityFromJson(json);
}
