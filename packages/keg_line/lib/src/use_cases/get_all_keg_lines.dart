import 'package:core/core.dart';

import '../entities/keg_line_entity.dart';

class GetAllKegLines extends GetAllEntitiesUseCase<KegLineEntity> {
  GetAllKegLines({required LineRepository<KegLineEntity> kegLineRepository})
    : super(lineRepository: kegLineRepository);
}
