import 'package:app/features/home/domain/entities/entities.dart';
import 'package:app/features/home/infrastructure/models/itbook/book_itbook.dart';

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
}
