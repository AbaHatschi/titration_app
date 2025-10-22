import 'package:freezed_annotation/freezed_annotation.dart';

part 'keg_line_dto.freezed.dart';
part 'keg_line_dto.g.dart';

@freezed
abstract class KegLineDto with _$KegLineDto {
  factory KegLineDto({
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
  }) = _KegLineDto;

  factory KegLineDto.fromJson(Map<String, dynamic> json) =>
      _$KegLineDtoFromJson(json);
}
