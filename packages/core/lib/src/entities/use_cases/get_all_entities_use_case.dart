import '../../utils/commands/result.dart';
import '../repositories/line_repository.dart';

abstract class GetAllEntitiesUseCase<T> {
  GetAllEntitiesUseCase({required LineRepository<T> lineRepository})
    : _lineRepository = lineRepository;

  final LineRepository<T> _lineRepository;

  Future<Result<List<T>>> call() {
    return _lineRepository.getAllLines();
  }
}
