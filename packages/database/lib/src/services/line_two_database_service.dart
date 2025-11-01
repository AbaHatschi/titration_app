import 'package:core/core.dart';

import '../databases/sembast_database.dart';

class LineTwoDatabaseService
    extends GenericDatabaseService<LineTwoDatabaseService> {
  LineTwoDatabaseService({required SembastDatabase sembastDatabase})
    : super(
        store: sembastDatabase.lineTwosStore,
        database: sembastDatabase.database,
      );
}
