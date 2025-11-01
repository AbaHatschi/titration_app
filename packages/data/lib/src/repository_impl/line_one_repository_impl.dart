import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:line_one/line_one.dart';

import '../mappers/line_one_mapper.dart';
import '../models/line_one_model.dart';

class LineOneRepositoryImpl implements LineRepository<LineOneEntity> {
  LineOneRepositoryImpl({
    required LineOneDatabaseService lineOneDatabaseService,
    required LineOneMapper lineOneMapper,
  }) : _lineOneDatabaseService = lineOneDatabaseService,
       _lineOneMapper = lineOneMapper;

  final LineOneDatabaseService _lineOneDatabaseService;
  final LineOneMapper _lineOneMapper;

  @override
  Future<Result<void>> deleteLine({required int key}) async {
    try {
      await _lineOneDatabaseService.delete(key: key);
      return const Result<void>.ok(null);
    } catch (e) {
      return Result<void>.error(Exception(e.toString()));
    }
  }

  @override
  Future<Result<List<LineOneEntity>>> getAllLines() async {
    try {
      final List<Map<String, dynamic>> records = await _lineOneDatabaseService
          .getAll();
      final List<LineOneEntity> entities = records
          .map(
            (Map<String, dynamic> record) =>
                _lineOneMapper.toEntity(model: LineOneModel.fromJson(record)),
          )
          .toList();
      return Result<List<LineOneEntity>>.ok(entities);
    } catch (e) {
      return Result<List<LineOneEntity>>.error(Exception(e.toString()));
    }
  }

  @override
  Future<Result<int>> insertLine({required LineOneEntity entity}) async {
    try {
      final LineOneModel model = _lineOneMapper.toModel(entity: entity);
      final int id = await _lineOneDatabaseService.insert(data: model.toJson());
      return Result<int>.ok(id);
    } catch (e) {
      return Result<int>.error(Exception(e.toString()));
    }
  }

  @override
  Future<Result<void>> updateLine({
    required int key,
    required LineOneEntity entity,
  }) async {
    try {
      final LineOneModel model = _lineOneMapper.toModel(entity: entity);
      await _lineOneDatabaseService.update(key: key, data: model.toJson());
      return const Result<void>.ok(null);
    } catch (e) {
      return Result<void>.error(Exception(e.toString()));
    }
  }
}
