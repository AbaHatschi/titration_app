import 'package:core/core.dart';
import 'package:line_one/line_one.dart';

import '../models/line_one_model.dart';

/// Mapper class to convert between LineOneModel and LineOneEntity
class LineOneMapper implements EntityModelMapper<LineOneEntity, LineOneModel> {
  /// Converts LineOneEntity to LineOneModel
  /// [entity]: The LineOneEntity to convert
  /// Returns: The corresponding LineOneModel
  @override
  LineOneModel toModel({required LineOneEntity entity}) {
    return LineOneModel(
      id: entity.id,
      mValueLyeOne: entity.mValueLyeOne,
      pValueLyeOne: entity.pValueLyeOne,
      mValueLyeTwo: entity.mValueLyeTwo,
      pValueLyeTwo: entity.pValueLyeTwo,
      concentrationLyeOne: entity.concentrationLyeOne,
      sodaLyeOne: entity.sodaLyeOne,
      concentrationLyeTwo: entity.concentrationLyeTwo,
      sodaLyeTwo: entity.sodaLyeTwo,
      timestamp: entity.timestamp,
    );
  }

  /// Converts LineOneModel to LineOneEntity
  /// [model]: The LineOneModel to convert
  /// Returns: The corresponding LineOneEntity
  @override
  LineOneEntity toEntity({required LineOneModel model}) {
    return LineOneEntity(
      id: model.id,
      mValueLyeOne: model.mValueLyeOne,
      pValueLyeOne: model.pValueLyeOne,
      mValueLyeTwo: model.mValueLyeTwo,
      pValueLyeTwo: model.pValueLyeTwo,
      concentrationLyeOne: model.concentrationLyeOne,
      sodaLyeOne: model.sodaLyeOne,
      concentrationLyeTwo: model.concentrationLyeTwo,
      sodaLyeTwo: model.sodaLyeTwo,
      timestamp: model.timestamp,
    );
  }
}
