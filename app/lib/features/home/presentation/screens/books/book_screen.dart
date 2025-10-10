import 'package:app/features/home/domain/entities/entities.dart';
import 'package:app/features/home/presentation/providers/book_details_provider.dart';
import 'package:app/features/home/presentation/state/book_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookDetailsScreen extends ConsumerStatefulWidget {
  static const String routeName = '/bookScreen';
  const BookDetailsScreen({super.key, required this.isbn13});

  final String isbn13;

  @override
  ConsumerState<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends ConsumerState<BookDetailsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(bookDetailsProvider.notifier).loadBook(isbn13: widget.isbn13);
    });
  }

  @override
  Widget build(BuildContext context) {
    final BookDetailsMapState bookState = ref.watch(bookDetailsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Book Details')),
      body: Builder(
        builder: (context) {
          if (bookState.failure != null) {
            return Center(child: Text('Error: ${bookState.failure!.message}'));
          }

          final Book? book = bookState.books[widget.isbn13];

          if (bookState.isLoading || book == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.network(
                      bookState.books[widget.isbn13]?.image ?? '',
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    book.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Authors: ${book.authors}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Publisher: ${book.publisher}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Description: ${book.desc ?? 'Description no disponible'}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
