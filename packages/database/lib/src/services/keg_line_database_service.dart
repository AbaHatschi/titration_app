import 'package:core/core.dart';

import '../databases/sembast_database.dart';

class KegLineDatabaseService
    extends GenericDatabaseService<KegLineDatabaseService> {
  KegLineDatabaseService({required SembastDatabase sembastDatabase})
    : super(
        store: sembastDatabase.kegLinesStore,
        database: sembastDatabase.database,
      );
}
