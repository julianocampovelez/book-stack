abstract class LocalStorageDatasource {
  Future<void> setScoreBook({required String isbn13, required int score});
  Future<int> getScoreBook(String isbn13);
}
