import 'package:freezed_annotation/freezed_annotation.dart';

part 'line_one_dto.freezed.dart';
part 'line_one_dto.g.dart';

@freezed
abstract class LineOneDto with _$LineOneDto {
  factory LineOneDto({
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
  }) = _LineOneDto;

  factory LineOneDto.fromJson(Map<String, dynamic> json) =>
      _$LineOneDtoFromJson(json);
}
