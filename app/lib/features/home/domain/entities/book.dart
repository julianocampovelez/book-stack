class Book {
  String title;
  String subtitle;
  String isbn13;
  String image;
  String url;
  double price;
  String? authors;
  String? publisher;
  String? language;
  String? isbn10;
  String? pages;
  String? year;
  String? rating;
  String? desc;
  Map<String, dynamic>? pdf;

  Book({
    required this.title,
    required this.subtitle,
    required this.isbn13,
    required this.image,
    required this.url,
    required this.price,
    this.authors,
    this.publisher,
    this.language,
    this.isbn10,
    this.pages,
    this.year,
    this.rating,
    this.desc,
    this.pdf,
  });
}
