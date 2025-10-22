import 'package:freezed_annotation/freezed_annotation.dart';

part 'line_two_dto.freezed.dart';
part 'line_two_dto.g.dart';

@freezed
abstract class LineTwoDto with _$LineTwoDto {
  factory LineTwoDto({
    required int id,
    required double pLye1,
    required double mLye1,
    required double lyeConcentration1,
    required double lyeSoda1,
    required DateTime timeStamp,
  }) = _LineTwoDto;

  factory LineTwoDto.fromJson(Map<String, dynamic> json) =>
      _$LineTwoDtoFromJson(json);
}
