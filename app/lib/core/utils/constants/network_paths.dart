class NetworkPaths {
  static String getBooksPath(int page) => '/search/programming/$page';
  static String getBookByIsbn13Path(String isbn13) => '/books/$isbn13';
}
