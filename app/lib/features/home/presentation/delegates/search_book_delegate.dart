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
      print(result);
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
                return ListTile(
                  title: Text(book.title),
                  subtitle: Text(book.subtitle),
                  leading: book.image.isNotEmpty
                      ? Image.network(book.image)
                      : null,
                  onTap: () {
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
  }

  @override
  String get searchFieldLabel => 'Buscar libros...';

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
