import 'package:app/features/home/domain/datasources/datasources.dart';
import 'package:app/features/home/domain/repositories/repositories.dart';

class LocalStorageRepositoryImpl implements LocalStorageRepository {
  final LocalStorageDatasource datasource;
  LocalStorageRepositoryImpl(this.datasource);

  @override
  Future<int> getScoreBook(String isbn13) {
    return datasource.getScoreBook(isbn13.toString());
  }

  @override
  Future<void> setScoreBook({required String isbn13, required int score}) {
    return datasource.setScoreBook(isbn13: isbn13, score: score);
  }
}
