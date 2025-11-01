import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:line_two/line_two.dart';

import '../mappers/line_two_mapper.dart';
import '../models/line_two_model.dart';

class LineTwoRepositoryImpl implements LineRepository<LineTwoEntity> {
  LineTwoRepositoryImpl({
    required LineTwoDatabaseService lineTwoDatabaseService,
    required LineTwoMapper lineTwoMapper,
  }) : _lineTwoDatabaseService = lineTwoDatabaseService,
       _lineTwoMapper = lineTwoMapper;

  final LineTwoDatabaseService _lineTwoDatabaseService;
  final LineTwoMapper _lineTwoMapper;

  @override
  Future<Result<void>> deleteLine({required int key}) async {
    try {
      await _lineTwoDatabaseService.delete(key: key);
      return const Result<void>.ok(null);
    } catch (e) {
      return Result<void>.error(Exception(e.toString()));
    }
  }

  @override
  Future<Result<List<LineTwoEntity>>> getAllLines() async {
    try {
      final List<Map<String, dynamic>> records = await _lineTwoDatabaseService
          .getAll();
      final List<LineTwoEntity> entities = records
          .map(
            (Map<String, dynamic> record) =>
                _lineTwoMapper.toEntity(model: LineTwoModel.fromJson(record)),
          )
          .toList();
      return Result<List<LineTwoEntity>>.ok(entities);
    } catch (e) {
      return Result<List<LineTwoEntity>>.error(Exception(e.toString()));
    }
  }

  @override
  Future<Result<int>> insertLine({required LineTwoEntity entity}) async {
    try {
      final LineTwoModel model = _lineTwoMapper.toModel(entity: entity);
      final int id = await _lineTwoDatabaseService.insert(data: model.toJson());
      return Result<int>.ok(id);
    } catch (e) {
      return Result<int>.error(Exception(e.toString()));
    }
  }

  @override
  Future<Result<void>> updateLine({
    required int key,
    required LineTwoEntity entity,
  }) async {
    try {
      final LineTwoModel model = _lineTwoMapper.toModel(entity: entity);
      await _lineTwoDatabaseService.update(key: key, data: model.toJson());
      return const Result<void>.ok(null);
    } catch (e) {
      return Result<void>.error(Exception(e.toString()));
    }
  }
}
