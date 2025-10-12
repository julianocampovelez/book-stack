import 'book_itbook.dart';

/// Represents the response returned by the Itbook API.
///
/// Contains pagination data and a list of [BookItbook] results.
class ItbookResponse {
  /// Error code returned by the API, `"0"` means no error.
  final String error;

  /// Total number of results available.
  final String total;

  /// Current page number in the response.
  final String page;

  /// List of books returned by the API.
  final List<BookItbook> books;

  ItbookResponse({
    required this.error,
    required this.total,
    required this.page,
    required this.books,
  });

  /// Creates an [ItbookResponse] instance from a JSON map.
  factory ItbookResponse.fromJson(Map<String, dynamic> json) => ItbookResponse(
    error: json['error'],
    total: json['total'] ?? '0',
    page: json['page'] ?? '0',
    books: json['books'] == null
        ? []
        : List<BookItbook>.from(
            json['books'].map((x) => BookItbook.fromJson(x)),
          ),
  );

  /// Converts this [ItbookResponse] to a JSON map.
  Map<String, dynamic> toJson() => {
    'error': error,
    'total': total,
    'page': page,
    'books': List<dynamic>.from(books.map((x) => x.toJson())),
  };
}
