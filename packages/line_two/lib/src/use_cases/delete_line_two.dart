import 'package:core/core.dart';

import '../entities/line_two_entity.dart';

class DeleteLineTwo extends DeleteEntityUseCase<LineTwoEntity> {
  DeleteLineTwo({required LineRepository<LineTwoEntity> lineTwoRepository})
    : super(lineRepository: lineTwoRepository);
}
