import 'package:core/core.dart';
import 'package:line_two/line_two.dart';

import '../models/line_two_model.dart';

/// Mapper class to convert between LineTwoModel and LineTwoEntity
class LineTwoMapper implements EntityModelMapper<LineTwoEntity, LineTwoModel> {
  /// Converts LineTwoEntity to LineTwoModel
  /// [entity]: The LineTwoEntity to convert
  /// Returns: The corresponding LineTwoModel
  @override
  LineTwoModel toModel({required LineTwoEntity entity}) {
    return LineTwoModel(
      id: entity.id,
      mValueLyeOne: entity.mValueLyeOne,
      pValueLyeOne: entity.pValueLyeOne,
      concentrationLyeOne: entity.concentrationLyeOne,
      sodaLyeOne: entity.sodaLyeOne,
      timestamp: entity.timestamp,
    );
  }

  /// Converts LineTwoModel to LineTwoEntity
  /// [model]: The LineTwoModel to convert
  /// Returns: The corresponding LineTwoEntity
  @override
  LineTwoEntity toEntity({required LineTwoModel model}) {
    return LineTwoEntity(
      id: model.id,
      mValueLyeOne: model.mValueLyeOne,
      pValueLyeOne: model.pValueLyeOne,
      concentrationLyeOne: model.concentrationLyeOne,
      sodaLyeOne: model.sodaLyeOne,
      timestamp: model.timestamp,
    );
  }
}
