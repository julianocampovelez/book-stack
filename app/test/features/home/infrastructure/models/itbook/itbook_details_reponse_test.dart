import 'package:app/features/home/infrastructure/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ItbookDetailsResponse', () {
    final mockJson = {
      "error": "0",
      "title": "Clean Code",
      "subtitle": "A Handbook of Agile Software Craftsmanship",
      "authors": "Robert C. Martin",
      "publisher": "Prentice Hall",
      "language": "English",
      "isbn10": "0132350882",
      "isbn13": "9780132350884",
      "pages": "464",
      "year": "2008",
      "rating": "5",
      "desc":
          "Even bad code can function. But if code isn’t clean, it can bring a development organization to its knees.",
      "price": "\$30.00",
      "image": "https://itbook.store/img/books/9780132350884.png",
      "url": "https://itbook.store/books/9780132350884",
      "pdf": {
        "Chapter 1": "https://example.com/chapter1.pdf",
        "Chapter 2": "https://example.com/chapter2.pdf",
      },
    };

    test('✅ fromJson crea una instancia válida', () {
      final details = ItbookDetailsResponse.fromJson(mockJson);

      expect(details.error, "0");
      expect(details.title, "Clean Code");
      expect(details.authors, "Robert C. Martin");
      expect(details.isbn13, "9780132350884");
      expect(details.pdf, isA<Map<String, dynamic>>());
      expect(details.pdf!.containsKey("Chapter 1"), isTrue);
    });

    test('✅ toJson devuelve un mapa equivalente al original', () {
      final details = ItbookDetailsResponse.fromJson(mockJson);
      final jsonResult = details.toJson();

      expect(jsonResult, equals(mockJson));
    });

    test('✅ serialización/deserialización es consistente', () {
      final details = ItbookDetailsResponse.fromJson(mockJson);
      final jsonResult = details.toJson();
      final details2 = ItbookDetailsResponse.fromJson(jsonResult);

      expect(details2.title, details.title);
      expect(details2.price, details.price);
      expect(details2.pdf, details.pdf);
    });
  });
}
