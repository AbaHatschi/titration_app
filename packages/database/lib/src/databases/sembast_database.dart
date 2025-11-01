import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';

class SembastDatabase {
  static const String databaseName = 'titration_app.db';
  static const String storeKegLines = 'keg_lines';
  static const String storeLineOnes = 'line_ones';
  static const String storeLineTwos = 'line_twos';

  late Database _database;

  final StoreRef<int, Map<String, Object?>> _kegLinesStore = intMapStoreFactory
      .store(storeKegLines);
  final StoreRef<int, Map<String, Object?>> _lineOnesStore = intMapStoreFactory
      .store(storeLineOnes);
  final StoreRef<int, Map<String, Object?>> _lineTwosStore = intMapStoreFactory
      .store(storeLineTwos);

  // Public getters for services
  Database get database => _database;
  StoreRef<int, Map<String, Object?>> get kegLinesStore => _kegLinesStore;
  StoreRef<int, Map<String, Object?>> get lineOnesStore => _lineOnesStore;
  StoreRef<int, Map<String, Object?>> get lineTwosStore => _lineTwosStore;

  Future<void> initializeDatabase() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String databasePath = '${directory.path}/$databaseName';
    _database = await databaseFactoryIo.openDatabase(databasePath);
  }
}
