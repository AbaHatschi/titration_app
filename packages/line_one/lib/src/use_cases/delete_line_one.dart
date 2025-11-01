import 'package:core/core.dart';

import '../entities/line_one_entity.dart';

class DeleteLineOne extends DeleteEntityUseCase<LineOneEntity> {
  DeleteLineOne({required LineRepository<LineOneEntity> lineOneRepository})
    : super(lineRepository: lineOneRepository);
}
