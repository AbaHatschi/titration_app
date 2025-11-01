import 'package:sembast/sembast.dart';

abstract class GenericDatabaseService<T> {
  GenericDatabaseService({required this.store, required this.database});

  final StoreRef<int, Map<String, Object?>> store;
  final Database database;

  Future<int> insert({required Map<String, dynamic> data}) async =>
      store.add(database, data);

  Future<List<Map<String, dynamic>>> getAll() async {
    final List<RecordSnapshot<int, Map<String, Object?>>> records = await store
        .find(database);
    return records
        .map((RecordSnapshot<int, Map<String, Object?>> e) => e.value)
        .toList();
  }

  Future<void> update({
    required int key,
    required Map<String, dynamic> data,
  }) async => store.record(key).put(database, data);

  Future<void> delete({required int key}) async =>
      store.record(key).delete(database);
}
