import 'package:core/core.dart';

import '../databases/sembast_database.dart';

class LineOneDatabaseService
    extends GenericDatabaseService<LineOneDatabaseService> {
  LineOneDatabaseService({required SembastDatabase sembastDatabase})
    : super(
        store: sembastDatabase.lineOnesStore,
        database: sembastDatabase.database,
      );
}
