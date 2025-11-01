import 'package:core/core.dart';

import '../entities/line_two_entity.dart';

class UpdateLineTwo extends UpdateEntityUseCase<LineTwoEntity> {
  UpdateLineTwo({required LineRepository<LineTwoEntity> lineTwoRepository})
    : super(lineRepository: lineTwoRepository);
}
