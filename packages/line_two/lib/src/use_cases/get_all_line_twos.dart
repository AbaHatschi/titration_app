import 'package:core/core.dart';

import '../entities/line_two_entity.dart';

class GetAllLineTwos extends GetAllEntitiesUseCase<LineTwoEntity> {
  GetAllLineTwos({required LineRepository<LineTwoEntity> lineTwoRepository})
    : super(lineRepository: lineTwoRepository);
}
