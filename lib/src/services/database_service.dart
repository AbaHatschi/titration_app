import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';

class DatabaseService {
  late Database _db;

  late StoreRef<int, Map<String, dynamic>> _lineOneStore;
  late StoreRef<int, Map<String, dynamic>> _lineTwoStore;
  late StoreRef<int, Map<String, dynamic>> _kegLineStore;

  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  Future<void> initialize() async {
    if (_isInitialized) {
      return;
    }

    try {
      final Directory dir = await getApplicationDocumentsDirectory();
      final String dbPath = '${dir.path}/titration_app.db';

      _db = await databaseFactoryIo.openDatabase(dbPath);

      _lineOneStore = intMapStoreFactory.store('LineOne');
      _lineTwoStore = intMapStoreFactory.store('LineTwo');
      _kegLineStore = intMapStoreFactory.store('KegLine');

      _isInitialized = true;
      debugPrint('DatabaseService initialized successfully');
    } catch (e) {
      debugPrint('Failed to initialize DatabaseService: $e');
      rethrow;
    }
  }

  Future<int> saveLyeMeasurement({
    required String line,
    required String substanceName,
    required double pValue,
    required double mValue,
    required double concentration,
    required double soda,
  }) async {
    if (!_isInitialized) {
      throw Exception('DatabaseService not initialized');
    }

    final StoreRef<int, Map<String, dynamic>> store = _getStoreForLine(line);

    final Map<String, Object> record = <String, Object>{
      'substanceName': substanceName,
      'pValue': pValue,
      'mValue': mValue,
      'concentration': concentration,
      'soda': soda,
      'timestamp': DateTime.now().toIso8601String(),
    };

    return store.add(_db, record);
  }

  Future<int> saveAcidMeasurement({
    required String line,
    required String substanceName,
    required double mValue,
    required double concentration,
  }) async {
    if (!_isInitialized) {
      throw Exception('DatabaseService not initialized');
    }

    final StoreRef<int, Map<String, dynamic>> store = _getStoreForLine(line);

    final Map<String, Object> record = <String, Object>{
      'substanceName': substanceName,
      'mValue': mValue,
      'concentration': concentration,
      'timestamp': DateTime.now().toIso8601String(),
    };

    return store.add(_db, record);
  }

  Future<List<RecordSnapshot<int, Map<String, dynamic>>>>
  getMeasurementsForLine(String line) async {
    if (!_isInitialized) {
      throw Exception('DatabaseService not initialized');
    }

    final StoreRef<int, Map<String, dynamic>> store = _getStoreForLine(line);

    return store.find(_db);
  }

  Future<RecordSnapshot<int, Map<String, dynamic>>?> getMeasurementById(
    String line,
    int recordId,
  ) async {
    if (!_isInitialized) {
      throw Exception('DatabaseService not initialized');
    }

    final StoreRef<int, Map<String, dynamic>> store = _getStoreForLine(line);

    return store.record(recordId).getSnapshot(_db);
  }

  Future<void> updateMeasurement({
    required String line,
    required int recordId,
    required Map<String, dynamic> data,
  }) async {
    if (!_isInitialized) {
      throw Exception('DatabaseService not initialized');
    }

    final StoreRef<int, Map<String, dynamic>> store = _getStoreForLine(line);

    data['timestamp'] = DateTime.now().toIso8601String();

    await store.record(recordId).update(_db, data);
  }

  Future<void> deleteMeasurement({
    required String line,
    required int recordId,
  }) async {
    if (!_isInitialized) {
      throw Exception('DatabaseService not initialized');
    }

    final StoreRef<int, Map<String, dynamic>> store = _getStoreForLine(line);

    await store.record(recordId).delete(_db);
  }

  Future<void> deleteAllMeasurementsForLine(String line) async {
    if (!_isInitialized) {
      throw Exception('DatabaseService not initialized');
    }

    final StoreRef<int, Map<String, dynamic>> store = _getStoreForLine(line);

    await store.drop(_db);
  }

  StoreRef<int, Map<String, dynamic>> _getStoreForLine(String line) {
    switch (line) {
      case 'LineOne':
        return _lineOneStore;
      case 'LineTwo':
        return _lineTwoStore;
      case 'KegLine':
        return _kegLineStore;
      default:
        throw Exception('Unknown line: $line');
    }
  }

  Future<void> close() async {
    if (_isInitialized) {
      await _db.close();
      _isInitialized = false;
    }
  }
}
