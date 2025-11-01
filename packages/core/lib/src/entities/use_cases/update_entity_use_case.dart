import '../../utils/commands/result.dart';
import '../repositories/line_repository.dart';

abstract class UpdateEntityUseCase<T> {
  UpdateEntityUseCase({required LineRepository<T> lineRepository})
    : _lineRepository = lineRepository;

  final LineRepository<T> _lineRepository;

  Future<Result<void>> call({required int key, required T entity}) {
    return _lineRepository.updateLine(key: key, entity: entity);
  }
}
