import 'package:app/core/database/database.dart';
import 'package:app/features/home/domain/datasources/datasources.dart';
import 'package:drift/drift.dart' as drift;

class DriftLocalStorageDatasource implements LocalStorageDatasource {
  final AppDatabase db = AppDatabase();

  @override
  Future<int> getScoreBook(String isbn13) async {
    final query2 = db.delete(db.scoreBooks);
    query2.go();

    final query = db.select(db.scoreBooks)
      ..where((table) => table.isbn13.equals(isbn13));

    final results = await query.get();
    print('Getting score for ISBN13: $results');
    print('Results length: ${results.length}');

    final scoreBook = await query.getSingleOrNull();

    return scoreBook?.score ?? 0;
  }

  @override
  Future<void> setScoreBook({required String isbn13, required int score}) {
    print('DriftLocalStorageDatasource.setScoreBook: $isbn13 -> $score');
    return db
        .into(db.scoreBooks)
        .insertOnConflictUpdate(
          ScoreBooksCompanion(
            isbn13: drift.Value(isbn13),
            score: drift.Value(score),
          ),
        );
  }
}
