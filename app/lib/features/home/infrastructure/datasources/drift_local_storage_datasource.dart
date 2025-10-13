import 'package:drift/drift.dart' as drift;

import 'package:app/core/database/database.dart';
import 'package:app/features/home/domain/datasources/datasources.dart';

/// A local data source that handles book score persistence using Drift.
///
/// This class implements [LocalStorageDatasource]
/// to retrieve user-defined book scores from a
/// local SQLite database managed by Drift.
class DriftLocalStorageDatasource implements LocalStorageDatasource {
  /// The Drift database instance used for local data operations.
  final AppDatabase db = AppDatabase();

  /// Retrieves the score associated with the given [isbn13].
  ///
  /// Returns `0` if the book has no stored score.
  @override
  Future<int> getScoreBook(String isbn13) async {
    // db.delete(db.scoreBooks).go();

    final query = db.select(db.scoreBooks)
      ..where((table) => table.isbn13.equals(isbn13));

    final scoreBook = await query.getSingleOrNull();

    return scoreBook?.score ?? 0;
  }

  /// Inserts or updates the score for a book identified by [isbn13].
  ///
  /// If a record with the same [isbn13] already exists, it will be updated
  /// with the new [score] value.
  @override
  Future<void> setScoreBook({required String isbn13, required int score}) {
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
