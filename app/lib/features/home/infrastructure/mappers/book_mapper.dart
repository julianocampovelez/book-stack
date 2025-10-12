import 'package:app/features/home/domain/entities/entities.dart';
import 'package:app/features/home/infrastructure/models/models.dart';

/// Provides mapping functions between API models and domain entities.
///
/// This class is responsible for converting raw data received from
/// the Itbook API into [Book] domain entities used throughout the app.
class BookMapper {
  /// Converts a [BookItbook] API model into a [Book] domain entity.
  ///
  /// This method formats the `price` field by removing the `$` symbol
  /// and parsing it as a `double`. If parsing fails, the price defaults to `0.0`.
  ///
  /// Example:
  /// ```dart
  /// final book = BookMapper.itbookToEntity(apiBook);
  /// ```
  static Book itbookToEntity(BookItbook itbook) {
    final double formattedPrice = _parsePrice(itbook.price);

    return Book(
      title: itbook.title,
      subtitle: itbook.subtitle,
      isbn13: itbook.isbn13,
      image: itbook.image,
      url: itbook.url,
      price: formattedPrice,
    );
  }

  /// Converts a detailed [ItbookDetailsResponse] API model into a [Book] entity.
  ///
  /// In addition to the basic information, this method maps extra fields
  /// such as `authors`, `publisher`, `language`, `isbn10`, and `pdf`.
  static Book itbookDetailsToEntity(ItbookDetailsResponse itbook) {
    final double formattedPrice = _parsePrice(itbook.price);

    return Book(
      title: itbook.title,
      subtitle: itbook.subtitle,
      isbn13: itbook.isbn13,
      image: itbook.image,
      url: itbook.url,
      price: formattedPrice,
      authors: itbook.authors,
      publisher: itbook.publisher,
      language: itbook.language,
      isbn10: itbook.isbn10,
      pages: itbook.pages,
      year: itbook.year,
      rating: itbook.rating,
      desc: itbook.desc,
      pdf: itbook.pdf ?? {},
    );
  }

  /// Helper method to parse the price string from the API.
  static double _parsePrice(String price) {
    return double.tryParse(price.replaceAll('\$', '')) ?? 0.0;
  }
}
