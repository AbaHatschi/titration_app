import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';

/// Service to handle database operations for titration measurements.
/// Supports multiple lines: LineOne, LineTwo, and KegLine.
/// Provides methods to initialize the database, save, retrieve, update, and delete measurements.
/// Each line has its own store in the database.
class DatabaseService {
  late Database _db;

  // Stores for different lines
  late StoreRef<int, Map<String, dynamic>> _lineOneStore;
  late StoreRef<int, Map<String, dynamic>> _lineTwoStore;
  late StoreRef<int, Map<String, dynamic>> _kegLineStore;

  
  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  /// Initializes the database and its stores.
  /// Must be called before any database operations.
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

  /// Saves a lye measurement to the database.
  /// Parameters:
  /// - [line]: The line to which the measurement belongs (LineOne, LineTwo, KegLine).
  /// - [substanceName]: Name of the substance.
  /// - [pValue]: pH value of the measurement.
  /// - [mValue]: mL value of the measurement.
  /// - [concentration]: Concentration of the substance.
  /// - [soda]: Amount of soda used.
  /// 
  /// Returns the record ID of the saved measurement.
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

  /// Saves an acid measurement to the database.
  /// Parameters:
  /// - [line]: The line to which the measurement belongs (LineOne, LineTwo, KegLine).
  /// - [substanceName]: Name of the substance.
  /// - [mValue]: mL value of the measurement.
  /// - [concentration]: Concentration of the substance.
  /// 
  /// Returns the record ID of the saved measurement.
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

  /// Retrieves all measurements for a specific line.
  /// Parameters:
  /// - [line]: The line for which to retrieve measurements (LineOne, LineTwo, KegLine).
  /// 
  /// Returns a list of record snapshots containing the measurements.
  Future<List<RecordSnapshot<int, Map<String, dynamic>>>>
  getMeasurementsForLine(String line) async {
    if (!_isInitialized) {
      throw Exception('DatabaseService not initialized');
    }

    final StoreRef<int, Map<String, dynamic>> store = _getStoreForLine(line);

    return store.find(_db);
  }

  /// Retrieves a specific measurement by its ID.
  /// Parameters:
  /// - [line]: The line to which the measurement belongs (LineOne, LineTwo, KegLine).
  /// - [recordId]: The ID of the measurement record.
  /// 
  /// Returns the record snapshot of the measurement, or null if not found.
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

  /// Updates an existing measurement in the database.
  /// Parameters:
  /// - [line]: The line to which the measurement belongs (LineOne, LineTwo, KegLine).
  /// - [recordId]: The ID of the measurement record.
  /// - [data]: A map containing the updated measurement data.
  /// 
  /// Returns a Future that completes when the update is done.
  /// The 'timestamp' field is automatically updated to the current time.
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

  /// Deletes a specific measurement from the database.
  /// Parameters:
  /// - [line]: The line to which the measurement belongs (LineOne, LineTwo, KegLine).
  /// - [recordId]: The ID of the measurement record.
  /// 
  /// Returns a Future that completes when the deletion is done.
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

  /// Deletes all measurements for a specific line from the database.
  /// Parameters:
  /// - [line]: The line for which to delete measurements (LineOne, LineTwo, KegLine).
  /// 
  /// Returns a Future that completes when the deletion is done.
  Future<void> deleteAllMeasurementsForLine(String line) async {
    if (!_isInitialized) {
      throw Exception('DatabaseService not initialized');
    }

    final StoreRef<int, Map<String, dynamic>> store = _getStoreForLine(line);

    await store.drop(_db);
  }

  /// Helper method to get the store reference for a specific line.
  /// Parameters:
  /// - [line]: The line for which to get the store (LineOne, LineTwo, KegLine).
  /// 
  /// Returns the corresponding store reference.
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

  /// Closes the database connection.
  /// Should be called when the database is no longer needed.
  Future<void> close() async {
    if (_isInitialized) {
      await _db.close();
      _isInitialized = false;
    }
  }
}
