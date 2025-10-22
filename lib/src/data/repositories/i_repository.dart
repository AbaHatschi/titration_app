import '../../utils/result.dart';

abstract class IRepository<T> {
  Future<Result<int>> insert(T entity);
  Future<Result<List<T>>> getAll();
  Future<Result<void>> update(int key, T entity);
  Future<Result<void>> delete(int key);
}
