import '../../domain/keg_line_entity.dart';
import '../models/keg_line_dto.dart';

class KegLineMapper {
  /// Converts a KegLineDto to a KegLineEntity
  KegLineEntity toEntity(KegLineDto dto) {
    return KegLineEntity(
      id: dto.id,
      pLye1: dto.pLye1,
      mLye1: dto.mLye1,
      pLye2: dto.pLye2,
      mLye2: dto.mLye2,
      mAcid: dto.mAcid,
      lyeConcentration1: dto.lyeConcentration1,
      lyeSoda1: dto.lyeSoda1,
      lyeConcentration2: dto.lyeConcentration2,
      lyeSoda2: dto.lyeSoda2,
      acidConcentration: dto.acidConcentration,
      timeStamp: dto.timeStamp,
    );
  }

  /// Converts a KegLineEntity to a KegLineDto
  KegLineDto toDto(KegLineEntity entity) {
    return KegLineDto(
      id: entity.id,
      pLye1: entity.pLye1,
      mLye1: entity.mLye1,
      pLye2: entity.pLye2,
      mLye2: entity.mLye2,
      mAcid: entity.mAcid,
      lyeConcentration1: entity.lyeConcentration1,
      lyeSoda1: entity.lyeSoda1,
      lyeConcentration2: entity.lyeConcentration2,
      lyeSoda2: entity.lyeSoda2,
      acidConcentration: entity.acidConcentration,
      timeStamp: entity.timeStamp,
    );
  }
}
