import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';

class SembastService {
  static const String dbName = 'app.db';
  static const String storeLineOnes = 'line_ones';
  static const String storeLineTwos = 'line_twos';
  static const String storeKegLines = 'keg_lines';

  late Database _db;
  final StoreRef<int, Map<String, Object?>> _lineOnesStore = intMapStoreFactory
      .store(storeLineOnes);
  final StoreRef<int, Map<String, Object?>> _lineTwosStore = intMapStoreFactory
      .store(storeLineTwos);
  final StoreRef<int, Map<String, Object?>> _kegLinesStore = intMapStoreFactory
      .store(storeKegLines);

  Future<void> init() async {
    final Directory dir = await getApplicationDocumentsDirectory();
    final String dbPath = '${dir.path}/$dbName';
    _db = await databaseFactoryIo.openDatabase(dbPath);
  }

  // CRUD für line_ones
  Future<int> insertLineOne(Map<String, dynamic> data) async {
    return _lineOnesStore.add(_db, data);
  }

  Future<List<Map<String, dynamic>>> getAllLineOnes() async {
    final List<RecordSnapshot<int, Map<String, Object?>>> records =
        await _lineOnesStore.find(_db);
    return records
        .map((RecordSnapshot<int, Map<String, Object?>> e) => e.value)
        .toList();
  }

  Future<void> updateLineOne(int key, Map<String, dynamic> data) async {
    await _lineOnesStore.record(key).put(_db, data);
  }

  Future<void> deleteLineOne(int key) async {
    await _lineOnesStore.record(key).delete(_db);
  }

  // CRUD für line_twos
  Future<int> insertLineTwo(Map<String, dynamic> data) async {
    return _lineTwosStore.add(_db, data);
  }

  Future<List<Map<String, dynamic>>> getAllLineTwos() async {
    final List<RecordSnapshot<int, Map<String, Object?>>> records =
        await _lineTwosStore.find(_db);
    return records
        .map((RecordSnapshot<int, Map<String, Object?>> e) => e.value)
        .toList();
  }

  Future<void> updateLineTwo(int key, Map<String, dynamic> data) async {
    await _lineTwosStore.record(key).put(_db, data);
  }

  Future<void> deleteLineTwo(int key) async {
    await _lineTwosStore.record(key).delete(_db);
  }

  // CRUD für keg_lines
  Future<int> insertKegLine(Map<String, dynamic> data) async {
    return _kegLinesStore.add(_db, data);
  }

  Future<List<Map<String, dynamic>>> getAllKegLines() async {
    final List<RecordSnapshot<int, Map<String, Object?>>> records =
        await _kegLinesStore.find(_db);
    return records
        .map((RecordSnapshot<int, Map<String, Object?>> e) => e.value)
        .toList();
  }

  Future<void> updateKegLine(int key, Map<String, dynamic> data) async {
    await _kegLinesStore.record(key).put(_db, data);
  }

  Future<void> deleteKegLine(int key) async {
    await _kegLinesStore.record(key).delete(_db);
  }
}
