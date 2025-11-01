import 'package:core/core.dart';

import '../entities/line_one_entity.dart';

class GetAllLineOnes extends GetAllEntitiesUseCase<LineOneEntity> {
  GetAllLineOnes({required LineRepository<LineOneEntity> lineOneRepository})
    : super(lineRepository: lineOneRepository);
}
