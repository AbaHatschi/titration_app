import '../../domain/keg_line_entity.dart';
import '../../utils/result.dart';
import '../mappers/keg_line_mapper.dart';
import '../models/keg_line_dto.dart';
import '../services/sembast_service.dart';
import 'i_repository.dart';

class KegLineRepository implements IRepository<KegLineEntity> {
  KegLineRepository({required SembastService sembastService})
    : _sembastService = sembastService;

  final SembastService _sembastService;

  @override
  Future<Result<int>> insert(KegLineEntity entity) async {
    try {
      final KegLineDto dto = KegLineMapper.toDto(entity);
      final int id = await _sembastService.insertKegLine(dto.toJson());
      return Result<int>.ok(id);
    } catch (e) {
      return Result<int>.error(Exception(e.toString()));
    }
  }

  @override
  Future<Result<List<KegLineEntity>>> getAll() async {
    try {
      final List<Map<String, dynamic>> records = await _sembastService
          .getAllKegLines();
      final List<KegLineEntity> entities = records
          .map(
            (Map<String, dynamic> record) =>
                KegLineMapper.toEntity(KegLineDto.fromJson(record)),
          )
          .toList();
      return Result<List<KegLineEntity>>.ok(entities);
    } catch (e) {
      return Result<List<KegLineEntity>>.error(Exception(e.toString()));
    }
  }

  @override
  Future<Result<void>> update(int key, KegLineEntity entity) async {
    try {
      final KegLineDto dto = KegLineMapper.toDto(entity);
      await _sembastService.updateKegLine(key, dto.toJson());
      return const Result<void>.ok(null);
    } catch (e) {
      return Result<void>.error(Exception(e.toString()));
    }
  }

  @override
  Future<Result<void>> delete(int key) async {
    try {
      await _sembastService.deleteKegLine(key);
      return const Result<void>.ok(null);
    } catch (e) {
      return Result<void>.error(Exception(e.toString()));
    }
  }
}
