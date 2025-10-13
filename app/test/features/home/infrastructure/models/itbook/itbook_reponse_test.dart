import 'package:flutter_test/flutter_test.dart';

import 'package:app/features/home/infrastructure/models/itbook/itbook_response.dart';

void main() {
  test('should correctly parse ItbookResponse from valid JSON', () {
    final Map<String, dynamic> json = {
      "error": "0",
      "total": "1",
      "page": "1",
      "books": [
        {
          "title": "Flutter for Beginners",
          "subtitle":
              "Excepteur cupidatat in ea sit laborum esse amet laborum adipisicing irure aute pariatur.",
          "isbn13": "913123123",
          "price": "\$29.99",
          "image": "https://itbook.store/img/books/913123123.png",
          "url": "https://itbook.store/books/913123123",
        },
      ],
    };

    final ItbookResponse response = ItbookResponse.fromJson(json);

    expect(response.error, '0');
    expect(response.total, '1');
    expect(response.page, '1');
    expect(response.books.length, 1);
    expect(response.books[0].title, 'Flutter for Beginners');
  });

  test('should correctly parse ItbookResponse from minimal JSON', () {
    final Map<String, dynamic> json = {"error": "0"};

    final ItbookResponse response = ItbookResponse.fromJson(json);

    expect(response.error, '0');
    expect(response.total, '0');
    expect(response.page, '0');
    expect(response.books.length, 0);
  });
}
