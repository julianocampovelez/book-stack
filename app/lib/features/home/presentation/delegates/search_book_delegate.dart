import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:app/core/entities/either_entity.dart';
import 'package:app/core/network/errors/failures.dart';
import 'package:app/features/home/domain/entities/entities.dart';

typedef SearchBooksCallback =
    Future<Either<Failure, List<Book>>> Function({String query, int page});

class SearchBookDelegate extends SearchDelegate<Book?> {
  final SearchBooksCallback searchBooks;

  StreamController<Either<Failure, List<Book>>> debouncedStream =
      StreamController.broadcast();
  Timer? _debouncedTimer;

  SearchBookDelegate({required this.searchBooks});

  void _onQueryChanged(String query) {
    if (_debouncedTimer?.isActive ?? false) _debouncedTimer!.cancel();
    _debouncedTimer = Timer(const Duration(milliseconds: 500), () async {
      final String formattedQuery = query.replaceAll(' ', '+').trim();
      final Either<Failure, List<Book>> result = await searchBooks(
        query: formattedQuery,
      );

      if (debouncedStream.isClosed) return;
      debouncedStream.add(result);
    });
  }

  Widget _buildResults() {
    return StreamBuilder<Either<Failure, List<Book>>>(
      stream: debouncedStream.stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox.shrink();
        }

        return snapshot.data!.when(
          (failure) {
            return Center(child: Text(failure.message));
          },
          (books) {
            print(books);
            return ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                print(books[index].title);
                final book = books[index];
                return _BookItem(
                  book: book,
                  onBookSelected: (context, book) {
                    _clearStreams();
                    close(context, book);
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  void _clearStreams() {
    debouncedStream.close();
    _debouncedTimer?.cancel();
  }

  @override
  String get searchFieldLabel => 'Buscar libros...';

  @override
  TextStyle? get searchFieldStyle => const TextStyle(
    fontSize: DsTypoFoundations.fontSizeH3,
    fontWeight: FontWeight.w400,
  );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        _clearStreams();
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('builde results');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _onQueryChanged(query);
    return _buildResults();
  }
}

class _BookItem extends StatelessWidget {
  final Book book;
  final Function onBookSelected;

  const _BookItem({required this.book, required this.onBookSelected});

  @override
  Widget build(BuildContext context) {
    final TextTheme textStyles = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => onBookSelected(context, book),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Row(
          children: [
            SizedBox(
              width: size.width * 0.2,
              child: DsNetworkImage(url: book.image),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: size.width * 0.65,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title,
                    style: textStyles.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (book.subtitle.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        book.subtitle,
                        style: textStyles.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
