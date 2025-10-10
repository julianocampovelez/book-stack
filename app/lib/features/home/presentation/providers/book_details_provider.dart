import 'package:flutter_riverpod/legacy.dart';

import 'package:app/core/entities/either_entity.dart';
import 'package:app/core/network/errors/failures.dart';
import 'package:app/features/home/domain/entities/entities.dart';
import 'package:app/features/home/presentation/providers/providers.dart';
import 'package:app/features/home/presentation/state/book_details_state.dart';

final bookDetailsProvider =
    StateNotifierProvider<BookDetailsNotifier, BookDetailsMapState>((ref) {
      final getBookDetails = ref.watch(booksRepositoryProvider).getBookByIsbn13;
      return BookDetailsNotifier(getBookDetails: getBookDetails);
    });

typedef GetBookDetailsCallback =
    Future<Either<Failure, Book>> Function(String isbn13);

class BookDetailsNotifier extends StateNotifier<BookDetailsMapState> {
  BookDetailsNotifier({required this.getBookDetails})
    : super(BookDetailsMapState.initial());

  final GetBookDetailsCallback getBookDetails;

  Future<void> loadBook({required String isbn13}) async {
    state = state.copyWith(failure: null);

    if (state.books.containsKey(isbn13)) return;

    state = state.copyWith(isLoading: true);

    final Either<Failure, Book> response = await getBookDetails(isbn13);

    response.when(
      (failure) {
        state = state.copyWith(failure: failure);
      },
      (book) {
        state = state.copyWith(
          books: {...state.books, isbn13: book},
          failure: null,
        );
      },
    );

    state = state.copyWith(isLoading: false);
  }
}
