import '../../domain/line_one_entity.dart';
import '../models/line_one_dto.dart';

class LineOneMapper {
  /// Converts a LineOneDto to a LineOneEntity
  static LineOneEntity toEntity(LineOneDto dto) {
    return LineOneEntity(
      id: dto.id,
      pLye1: dto.pLye1,
      mLye1: dto.mLye1,
      pLye2: dto.pLye2,
      mLye2: dto.mLye2,
      lyeConcentration1: dto.lyeConcentration1,
      lyeSoda1: dto.lyeSoda1,
      lyeConcentration2: dto.lyeConcentration2,
      lyeSoda2: dto.lyeSoda2,
      timeStamp: dto.timeStamp,
    );
  }

  /// Converts a LineOneEntity to a LineOneDto
  static LineOneDto toDto(LineOneEntity entity) {
    return LineOneDto(
      id: entity.id,
      pLye1: entity.pLye1,
      mLye1: entity.mLye1,
      pLye2: entity.pLye2,
      mLye2: entity.mLye2,
      lyeConcentration1: entity.lyeConcentration1,
      lyeSoda1: entity.lyeSoda1,
      lyeConcentration2: entity.lyeConcentration2,
      lyeSoda2: entity.lyeSoda2,
      timeStamp: entity.timeStamp,
    );
  }
}
