import 'package:core/core.dart';

import '../entities/line_two_entity.dart';

class InsertLineTwo extends InsertEntityUseCase<LineTwoEntity> {
  InsertLineTwo({required LineRepository<LineTwoEntity> lineTwoRepository})
    : super(lineRepository: lineTwoRepository);
}
