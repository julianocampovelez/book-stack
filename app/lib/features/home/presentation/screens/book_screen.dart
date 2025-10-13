import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app/features/home/domain/entities/entities.dart';
import 'package:app/features/home/presentation/providers/providers.dart';
import 'package:app/features/home/presentation/state/book_details_state.dart';
import 'package:app/features/home/presentation/widgets/widgets.dart';
import 'package:design_system/design_system.dart';

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
          CustomSliverAppBar(
            book: book,
            failure: bookDetailsMap.failure,
            isLoading: bookDetailsMap.isLoading,
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: book != null
                  ? _BookDetailsView(book: book)
                  : const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}

class _BookDetailsView extends ConsumerWidget {
  final Book book;

  const _BookDetailsView({required this.book});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final int score = ref.watch(scoreBooksProvider)[book.isbn13] ?? 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Book Title
        Text(book.title, style: textTheme.titleMedium),
        const SizedBox(height: DsSpacing.spaceXXS),

        // Book Subtitle
        if (book.subtitle.isNotEmpty) ...[
          Text(book.subtitle, style: textTheme.bodyMedium),
          const SizedBox(height: DsSpacing.spaceXXS),
        ],

        // Book Authors
        Text(
          'Autor(es): ${book.authors ?? 'Autor desconocido'}',
          style: textTheme.bodyMedium,
        ),
        const SizedBox(height: DsSpacing.spaceXXS),

        // Book Publisher
        Text(
          'Editorial: ${book.publisher ?? 'Editorial desconocida'}',
          style: textTheme.bodyMedium,
        ),
        const SizedBox(height: DsSpacing.spaceSM),

        // Book Price
        Text(
          '\$${book.price.toString()}',
          style: textTheme.titleLarge?.copyWith(
            color: DsColorsFoundations.primaryColor,
          ),
        ),
        const SizedBox(height: DsSpacing.spaceSM),

        // Score Stars
        ScoreStars(
          score: score,
          onTap: (int ratingValue) => ref
              .read(scoreBooksProvider.notifier)
              .setScoreBook(isbn13: book.isbn13, score: ratingValue),
        ),

        const SizedBox(height: DsSpacing.spaceSM),
        Text(
          book.desc ?? 'Descripción no disponible',
          style: textTheme.bodyMedium,
        ),
        const SizedBox(height: DsSpacing.spaceMS),

        Text(
          'Año de publicación: ${book.year ?? 'Año desconocido'}',
          style: textTheme.bodyMedium,
        ),
        const SizedBox(height: DsSpacing.spaceXS),

        Text(
          'Idioma: ${book.language ?? 'Idioma desconocido'}',
          style: textTheme.bodyMedium,
        ),
        const SizedBox(height: DsSpacing.spaceMD),
      ],
    );
  }
}
