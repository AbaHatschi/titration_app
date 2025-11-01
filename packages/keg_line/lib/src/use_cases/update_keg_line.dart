import 'package:core/core.dart';

import '../entities/keg_line_entity.dart';

class UpdateKegLine extends UpdateEntityUseCase<KegLineEntity> {
  UpdateKegLine({required LineRepository<KegLineEntity> kegLineRepository})
    : super(lineRepository: kegLineRepository);
}
