import 'package:app/core/network/errors/failures.dart';
import 'package:app/features/home/domain/entities/entities.dart';

class BookDetailsMapState {
  final Map<String, Book> books;
  final bool isLoading;
  final Failure? failure;

  BookDetailsMapState({
    required this.books,
    this.isLoading = false,
    this.failure,
  });

  BookDetailsMapState copyWith({
    bool? isLoading,
    Failure? failure,
    Map<String, Book>? books,
  }) {
    return BookDetailsMapState(
      books: books ?? this.books,
      isLoading: isLoading ?? this.isLoading,
      failure: failure ?? this.failure,
    );
  }

  factory BookDetailsMapState.initial() => BookDetailsMapState(books: {});
}
