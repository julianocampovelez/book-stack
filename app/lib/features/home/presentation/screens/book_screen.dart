import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app/features/home/presentation/widgets/widgets.dart';
import 'package:app/core/network/errors/failures.dart';
import 'package:app/features/home/domain/entities/entities.dart';
import 'package:app/features/home/presentation/providers/providers.dart';
import 'package:app/features/home/presentation/state/book_details_state.dart';

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
      ref
          .read(scoreBooksProvider.notifier)
          .loadScoreBook(isbn13: widget.isbn13);
    });
  }

  @override
  Widget build(BuildContext context) {
    final BookDetailsMapState bookDetailsMap = ref.watch(bookDetailsProvider);
    final Book? book = bookDetailsMap.books[widget.isbn13];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomSliverAppBar(
            book: book,
            failure: bookDetailsMap.failure,
            isLoading: bookDetailsMap.isLoading,
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: book != null
                  ? _Content(book: book)
                  : const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}

class _Content extends ConsumerWidget {
  final Book book;

  const _Content({required this.book});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int score = ref.watch(scoreBooksProvider)[book.isbn13] ?? 0;
    return Column(
      children: [
        Text(
          book.title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text('Puntuación: '),

            ...List.generate(5, (index) {
              final int ratingValue = (index + 1);
              final bool isFilled = ratingValue <= score;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: GestureDetector(
                  onTap: () {
                    ref
                        .read(scoreBooksProvider.notifier)
                        .setScoreBook(isbn13: book.isbn13, score: ratingValue);
                  },
                  child: Icon(
                    isFilled ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                  ),
                ),
              );
            }),
          ],
        ),
      ],
    );
  }
}

class _CustomSliverAppBar extends ConsumerWidget {
  final bool isLoading;
  final Failure? failure;
  final Book? book;

  const _CustomSliverAppBar({
    required this.isLoading,
    required this.failure,
    required this.book,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    Widget content;

    if (isLoading || book == null) {
      content = const Center(
        child: CircularProgressIndicator(color: Color(0xfff95b1c)),
      );
    } else if (failure != null) {
      content = ErrorDetailsView(failure: failure!);
    } else {
      content = BookImageView(book: book!);
    }

    return SliverAppBar(
      backgroundColor: isDark
          ? Color(0xff262626)
          : Color.fromARGB(255, 238, 238, 238),
      expandedHeight: size.height * 0.6,
      foregroundColor: Colors.white,
      actions: [],
      flexibleSpace: FlexibleSpaceBar(
        background: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: content,
        ),
      ),
    );
  }
}

// Builder(
//         builder: (context) {
//           if (bookDetailsMap.failure != null) {
//             return Center(
//               child: Text('Error: ${bookDetailsMap.failure!.message}'),
//             );
//           }

//           final Book? book = bookDetailsMap.books[widget.isbn13];

//           if (bookDetailsMap.isLoading || book == null) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Center(
//                     child: Image.network(
//                       bookDetailsMap.books[widget.isbn13]?.image ?? '',
//                       height: 200,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   Text(
//                     book.title,
//                     style: const TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     children: [
//                       Text('Puntuación: '),

//                       ...List.generate(5, (index) {
//                         final int ratingValue = (index + 1);
//                         final bool isFilled = ratingValue <= score;

//                         return Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 2.0),
//                           child: GestureDetector(
//                             onTap: () {
//                               ref
//                                   .read(scoreBooksProvider.notifier)
//                                   .setScoreBook(
//                                     isbn13: widget.isbn13,
//                                     score: ratingValue,
//                                   );
//                             },
//                             child: Icon(
//                               isFilled ? Icons.star : Icons.star_border,
//                               color: Colors.amber,
//                             ),
//                           ),
//                         );
//                       }),
//                     ],
//                   ),

//                   Text(
//                     'Authors: ${book.authors}',
//                     style: const TextStyle(fontSize: 16),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     'Publisher: ${book.publisher}',
//                     style: const TextStyle(fontSize: 16),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     'Description: ${book.desc ?? 'Description no disponible'}',
//                     style: const TextStyle(fontSize: 16),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
