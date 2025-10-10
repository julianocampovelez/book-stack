import 'package:app/core/network/errors/failures.dart';
import 'package:app/features/home/domain/entities/entities.dart';

class BooksState {
  const BooksState({this.books = const [], this.failure});

  final List<Book> books;
  final Failure? failure;

  BooksState copyWith({List<Book>? books, Failure? failure}) {
    return BooksState(
      books: books ?? this.books,
      failure: failure ?? this.failure,
    );
  }

  factory BooksState.initial() => const BooksState();
}
