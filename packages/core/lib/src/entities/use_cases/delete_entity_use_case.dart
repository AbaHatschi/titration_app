import '../../utils/commands/result.dart';
import '../repositories/line_repository.dart';

abstract class DeleteEntityUseCase<T> {
  DeleteEntityUseCase({required LineRepository<T> lineRepository})
    : _lineRepository = lineRepository;

  final LineRepository<T> _lineRepository;

  Future<Result<void>> call({required int key}) {
    return _lineRepository.deleteLine(key: key);
  }
}
