import 'package:core/core.dart';

import '../entities/line_one_entity.dart';

class InsertLineOne extends InsertEntityUseCase<LineOneEntity> {
  InsertLineOne({required LineRepository<LineOneEntity> lineOneRepository})
    : super(lineRepository: lineOneRepository);
}
