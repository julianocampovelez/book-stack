import 'package:flutter_riverpod/legacy.dart';

import 'package:app/core/entities/either_entity.dart';
import 'package:app/core/network/errors/failures.dart';
import 'package:app/features/home/domain/entities/entities.dart';
import 'package:app/features/home/presentation/providers/providers.dart';
import 'package:app/features/home/presentation/state/books_state.dart';

final programmingBooksProvider =
    StateNotifierProvider<BooksNotifier, BooksState>((ref) {
      final getBooks = ref.watch(booksRepositoryProvider).getBooks;
      return BooksNotifier(getBooks: getBooks);
    });

typedef BooksCallback =
    Future<Either<Failure, List<Book>>> Function({int page});

class BooksNotifier extends StateNotifier<BooksState> {
  BooksNotifier({required this.getBooks}) : super(BooksState.initial());

  int currentPage = 0;
  bool isLoading = false;
  BooksCallback getBooks;

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    currentPage++;

    final Either<Failure, List<Book>> response = await getBooks(
      page: currentPage,
    );

    response.when((failure) => state = state.copyWith(failure: failure), (
      data,
    ) {
      final List<Book> updatedBooks = [...state.books, ...data];
      state = state.copyWith(books: updatedBooks, failure: null);
    });

    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}
