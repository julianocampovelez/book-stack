/// Represents a single book item returned by the Itbook API.
///
/// Contains basic information such as title, price, and image URL.
class BookItbook {
  /// The main title of the book.
  final String title;

  /// The subtitle or brief description of the book.
  final String subtitle;

  /// The ISBN-13 identifier of the book.
  final String isbn13;

  /// The price of the book as a formatted string.
  final String price;

  /// The URL of the book's cover image.
  final String image;

  /// The URL to the detailed book page on Itbook API.
  final String url;

  /// Creates a [BookItbook] instance with the given details.
  BookItbook({
    required this.title,
    required this.subtitle,
    required this.isbn13,
    required this.price,
    required this.image,
    required this.url,
  });

  /// Creates a [BookItbook] from a JSON map.
  factory BookItbook.fromJson(Map<String, dynamic> json) => BookItbook(
    title: json['title'],
    subtitle: json['subtitle'],
    isbn13: json['isbn13'],
    price: json['price'],
    image: json['image'],
    url: json['url'],
  );

  /// Converts this [BookItbook] instance to a JSON map.
  Map<String, dynamic> toJson() => {
    'title': title,
    'subtitle': subtitle,
    'isbn13': isbn13,
    'price': price,
    'image': image,
    'url': url,
  };
}
