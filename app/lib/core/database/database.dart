import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

class ScoreBooks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get isbn13 => text().named('isbn13')();
  IntColumn get score => integer().withDefault(const Constant(0))();
}

@DriftDatabase(tables: [ScoreBooks])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'bs_database',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}
