import '../../utils/commands/result.dart';
import '../repositories/line_repository.dart';

abstract class InsertEntityUseCase<T> {
  InsertEntityUseCase({required LineRepository<T> lineRepository})
    : _lineRepository = lineRepository;

  final LineRepository<T> _lineRepository;

  Future<Result<int>> call({required T entity}) {
    return _lineRepository.insertLine(entity: entity);
  }
}
