import 'package:freezed_annotation/freezed_annotation.dart';

part 'line_two_entity.freezed.dart';
part 'line_two_entity.g.dart';

@freezed
abstract class LineTwoEntity with _$LineTwoEntity {
  factory LineTwoEntity({
    required int id,
    required double pLye1,
    required double mLye1,
    required double lyeConcentration1,
    required double lyeSoda1,
    required DateTime timeStamp,
  }) = _LineTwoEntity;

  factory LineTwoEntity.fromJson(Map<String, dynamic> json) =>
      _$LineTwoEntityFromJson(json);
}
