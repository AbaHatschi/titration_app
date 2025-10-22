import '../../domain/line_one_entity.dart';
import '../../utils/result.dart';
import '../mappers/line_one_mapper.dart';
import '../models/line_one_dto.dart';
import '../services/sembast_service.dart';
import 'i_repository.dart';

class LineOneRepository implements IRepository<LineOneEntity> {
  LineOneRepository({required SembastService sembastService})
    : _sembastService = sembastService;

  final SembastService _sembastService;

  @override
  Future<Result<int>> insert(LineOneEntity entity) async {
    try {
      final LineOneDto dto = LineOneMapper.toDto(entity);
      final int id = await _sembastService.insertLineOne(dto.toJson());
      return Result<int>.ok(id);
    } catch (e) {
      return Result<int>.error(Exception(e.toString()));
    }
  }

  @override
  Future<Result<List<LineOneEntity>>> getAll() async {
    try {
      final List<Map<String, dynamic>> records = await _sembastService
          .getAllLineOnes();
      final List<LineOneEntity> entities = records
          .map(
            (Map<String, dynamic> record) =>
                LineOneMapper.toEntity(LineOneDto.fromJson(record)),
          )
          .toList();
      return Result<List<LineOneEntity>>.ok(entities);
    } catch (e) {
      return Result<List<LineOneEntity>>.error(Exception(e.toString()));
    }
  }

  @override
  Future<Result<void>> update(int key, LineOneEntity entity) async {
    try {
      final LineOneDto dto = LineOneMapper.toDto(entity);
      await _sembastService.updateLineOne(key, dto.toJson());
      return const Result<void>.ok(null);
    } catch (e) {
      return Result<void>.error(Exception(e.toString()));
    }
  }

  @override
  Future<Result<void>> delete(int key) async {
    try {
      await _sembastService.deleteLineOne(key);
      return const Result<void>.ok(null);
    } catch (e) {
      return Result<void>.error(Exception(e.toString()));
    }
  }
}
