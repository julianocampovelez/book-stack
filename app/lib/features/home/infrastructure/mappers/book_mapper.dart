import 'package:app/features/home/domain/entities/entities.dart';

import 'package:app/features/home/infrastructure/models/models.dart';

class BookMapper {
  static Book itbookToEntity(BookItbook itbook) {
    final double formattedPrice =
        double.tryParse(itbook.price.replaceAll('\$', '')) ?? 0.0;

    return Book(
      title: itbook.title,
      subtitle: itbook.subtitle,
      isbn13: itbook.isbn13,
      image: itbook.image,
      url: itbook.url,
      price: formattedPrice,
    );
  }

  static Book itbookDetailsToEntity(ItbookDetailsResponse itbook) {
    final double formattedPrice =
        double.tryParse(itbook.price.replaceAll('\$', '')) ?? 0.0;

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
}
