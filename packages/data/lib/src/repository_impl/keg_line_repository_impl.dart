import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:keg_line/keg_line.dart';

import '../mappers/keg_line_mapper.dart';
import '../models/keg_line_model.dart';

class KegLineRepositoryImpl implements LineRepository<KegLineEntity> {
  KegLineRepositoryImpl({
    required KegLineDatabaseService kegLineDatabaseService,
    required KegLineMapper kegLineMapper,
  }) : _kegLineDatabaseService = kegLineDatabaseService,
       _kegLineMapper = kegLineMapper;

  final KegLineDatabaseService _kegLineDatabaseService;
  final KegLineMapper _kegLineMapper;

  @override
  Future<Result<void>> deleteLine({required int key}) async {
    try {
      await _kegLineDatabaseService.delete(key: key);
      return const Result<void>.ok(null);
    } catch (e) {
      return Result<void>.error(Exception(e.toString()));
    }
  }

  @override
  Future<Result<List<KegLineEntity>>> getAllLines() async {
    try {
      final List<Map<String, dynamic>> records = await _kegLineDatabaseService
          .getAll();
      final List<KegLineEntity> entities = records
          .map(
            (Map<String, dynamic> record) =>
                _kegLineMapper.toEntity(model: KegLineModel.fromJson(record)),
          )
          .toList();
      return Result<List<KegLineEntity>>.ok(entities);
    } catch (e) {
      return Result<List<KegLineEntity>>.error(Exception(e.toString()));
    }
  }

  @override
  Future<Result<int>> insertLine({required KegLineEntity entity}) async {
    try {
      final KegLineModel model = _kegLineMapper.toModel(entity: entity);
      final int id = await _kegLineDatabaseService.insert(data: model.toJson());
      return Result<int>.ok(id);
    } catch (e) {
      return Result<int>.error(Exception(e.toString()));
    }
  }

  @override
  Future<Result<void>> updateLine({
    required int key,
    required KegLineEntity entity,
  }) async {
    try {
      final KegLineModel model = _kegLineMapper.toModel(entity: entity);
      await _kegLineDatabaseService.update(key: key, data: model.toJson());
      return const Result<void>.ok(null);
    } catch (e) {
      return Result<void>.error(Exception(e.toString()));
    }
  }
}
