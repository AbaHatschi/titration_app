import 'package:core/core.dart';

import '../entities/keg_line_entity.dart';

class InsertKegLine extends InsertEntityUseCase<KegLineEntity> {
  InsertKegLine({required LineRepository<KegLineEntity> kegLineRepository})
    : super(lineRepository: kegLineRepository);
}
