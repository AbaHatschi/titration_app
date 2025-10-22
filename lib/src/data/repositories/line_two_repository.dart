import '../../domain/line_two_entity.dart';
import '../../utils/result.dart';
import '../mappers/line_two_mapper.dart';
import '../models/line_two_dto.dart';
import '../services/sembast_service.dart';
import 'i_repository.dart';

class LineTwoRepository implements IRepository<LineTwoEntity> {
  LineTwoRepository({required SembastService sembastService})
    : _sembastService = sembastService;

  final SembastService _sembastService;

  @override
  Future<Result<int>> insert(LineTwoEntity entity) async {
    try {
      final LineTwoDto dto = LineTwoMapper.toDto(entity);
      final int id = await _sembastService.insertLineTwo(dto.toJson());
      return Result<int>.ok(id);
    } catch (e) {
      return Result<int>.error(Exception(e.toString()));
    }
  }

  @override
  Future<Result<List<LineTwoEntity>>> getAll() async {
    try {
      final List<Map<String, dynamic>> records = await _sembastService
          .getAllLineTwos();
      final List<LineTwoEntity> entities = records
          .map(
            (Map<String, dynamic> record) =>
                LineTwoMapper.toEntity(LineTwoDto.fromJson(record)),
          )
          .toList();
      return Result<List<LineTwoEntity>>.ok(entities);
    } catch (e) {
      return Result<List<LineTwoEntity>>.error(Exception(e.toString()));
    }
  }

  @override
  Future<Result<void>> update(int key, LineTwoEntity entity) async {
    try {
      final LineTwoDto dto = LineTwoMapper.toDto(entity);
      await _sembastService.updateLineTwo(key, dto.toJson());
      return const Result<void>.ok(null);
    } catch (e) {
      return Result<void>.error(Exception(e.toString()));
    }
  }

  @override
  Future<Result<void>> delete(int key) async {
    try {
      await _sembastService.deleteLineTwo(key);
      return const Result<void>.ok(null);
    } catch (e) {
      return Result<void>.error(Exception(e.toString()));
    }
  }
}
