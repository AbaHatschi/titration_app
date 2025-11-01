import '../../utils/commands/result.dart';

abstract class LineRepository<T> {
  Future<Result<int>> insertLine({required T entity});
  Future<Result<List<T>>> getAllLines();
  Future<Result<void>> updateLine({required int key, required T entity});
  Future<Result<void>> deleteLine({required int key});
}
