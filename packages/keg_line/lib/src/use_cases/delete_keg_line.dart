import 'package:core/core.dart';

import '../entities/keg_line_entity.dart';

class DeleteKegLine extends DeleteEntityUseCase<KegLineEntity> {
  DeleteKegLine({required LineRepository<KegLineEntity> kegLineRepository})
    : super(lineRepository: kegLineRepository);
}
