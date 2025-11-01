import 'package:core/core.dart';

import '../entities/line_one_entity.dart';

class UpdateLineOne extends UpdateEntityUseCase<LineOneEntity> {
  UpdateLineOne({required LineRepository<LineOneEntity> lineOneRepository})
    : super(lineRepository: lineOneRepository);
}
