import 'package:core/core.dart';
import 'package:keg_line/keg_line.dart';

import '../models/keg_line_model.dart';

/// Mapper class for converting between KegLineEntity and KegLineModel
/// KegLineMapper provides methods to convert from entity to model and vice versa.
class KegLineMapper implements EntityModelMapper<KegLineEntity, KegLineModel> {
  /// Converts a KegLineEntity to a KegLineModel.
  /// [entity] The KegLineEntity to convert.
  /// Returns the corresponding KegLineModel.
  @override
  KegLineModel toModel({required KegLineEntity entity}) {
    return KegLineModel(
      id: entity.id,
      mValueLyeOne: entity.mValueLyeOne,
      pValueLyeOne: entity.pValueLyeOne,
      mValueLyeTwo: entity.mValueLyeTwo,
      pValueLyeTwo: entity.pValueLyeTwo,
      mValueAcid: entity.mValueAcid,
      concentrationLyeOne: entity.concentrationLyeOne,
      sodaLyeOne: entity.sodaLyeOne,
      concentrationLyeTwo: entity.concentrationLyeTwo,
      sodaLyeTwo: entity.sodaLyeTwo,
      concentrationAcid: entity.concentrationAcid,
      timestamp: entity.timestamp,
    );
  }

  /// Converts a KegLineModel to a KegLineEntity.
  /// [model] The KegLineModel to convert.
  /// Returns the corresponding KegLineEntity.
  @override
  KegLineEntity toEntity({required KegLineModel model}) {
    return KegLineEntity(
      id: model.id,
      mValueLyeOne: model.mValueLyeOne,
      pValueLyeOne: model.pValueLyeOne,
      mValueLyeTwo: model.mValueLyeTwo,
      pValueLyeTwo: model.pValueLyeTwo,
      mValueAcid: model.mValueAcid,
      concentrationLyeOne: model.concentrationLyeOne,
      sodaLyeOne: model.sodaLyeOne,
      concentrationLyeTwo: model.concentrationLyeTwo,
      sodaLyeTwo: model.sodaLyeTwo,
      concentrationAcid: model.concentrationAcid,
      timestamp: model.timestamp,
    );
  }
}
