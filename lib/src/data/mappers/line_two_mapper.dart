import '../../domain/line_two_entity.dart';
import '../models/line_two_dto.dart';

class LineTwoMapper {
  /// Converts a LineTwoDto to a LineTwoEntity
  static LineTwoEntity toEntity(LineTwoDto dto) {
    return LineTwoEntity(
      id: dto.id,
      pLye1: dto.pLye1,
      mLye1: dto.mLye1,
      lyeConcentration1: dto.lyeConcentration1,
      lyeSoda1: dto.lyeSoda1,
      timeStamp: dto.timeStamp,
    );
  }

  /// Converts a LineTwoEntity to a LineTwoDto
  static LineTwoDto toDto(LineTwoEntity entity) {
    return LineTwoDto(
      id: entity.id,
      pLye1: entity.pLye1,
      mLye1: entity.mLye1,
      lyeConcentration1: entity.lyeConcentration1,
      lyeSoda1: entity.lyeSoda1,
      timeStamp: entity.timeStamp,
    );
  }
}
