import 'package:app/core/network/errors/failures.dart';
import 'package:design_system/foundations/colors.dart';
import 'package:design_system/tokens/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:app/features/home/domain/entities/entities.dart';
import 'package:app/features/home/presentation/delegates/search_book_delegate.dart';
import 'package:app/features/home/presentation/providers/books/books_provider.dart';
import 'package:app/features/home/presentation/providers/providers.dart';
import 'package:app/features/home/presentation/screens/screens.dart';
import 'package:app/features/home/presentation/state/books_state.dart';
import 'package:app/features/home/presentation/state/sort_provider.dart';
import 'package:design_system/design_system.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const String routeName = '/homeScreen';
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // Add a listener to the scroll controller to detect when the user scrolls to the end
    scrollController.addListener(_onScrollEnd);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Load the first page of books when the widget is built
      ref.read(programmingBooksProvider.notifier).loadNextPage();
    });
  }

  // Function to load more books when the user scrolls to the end
  void _onScrollEnd() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 100) {
      ref.read(programmingBooksProvider.notifier).loadNextPage();
    }
  }

  // Function to handle sorting, scroll to top and update state
  void _handleSort(PriceOrder order) async {
    await scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

    ref.read(programmingBooksProvider.notifier).sortByPrice(order);
  }

  // Function to determine the icon of icon button theme based on the current theme
  IconData _iconTheme() {
    return Theme.of(context).brightness == Brightness.dark
        ? Icons.dark_mode_outlined
        : Icons.light_mode_outlined;
  }

  @override
  Widget build(BuildContext context) {
    final BooksState booksState = ref.watch(programmingBooksProvider);
    final PriceOrder currentSortOrder = ref.watch(sortBooksProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                DsColorsFoundations.primaryColor,
                DsColorsFoundations.secondaryColor,
              ],
            ),
          ),
        ),
        title: const Text(
          'Book Stack',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        actions: [
          DsIconButton(
            icon: Icon(_iconTheme()),
            onPressed: () {
              ref.read(themeNotifierProvider.notifier).toggleThemeMode();
            },
          ),

          DsIconButton(
            onPressed: () async {
              final Book? book = await showSearch<Book?>(
                context: context,
                delegate: SearchBookDelegate(
                  searchBooks: ref.read(booksRepositoryProvider).searchBooks,
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),

          DsIconButton(
            onPressed: () async {
              final selected = await showMenu<PriceOrder>(
                initialValue: currentSortOrder,
                context: context,
                position: const RelativeRect.fromLTRB(3000, 80, 16, 0),
                items: const [
                  PopupMenuItem(
                    value: PriceOrder.ascending,
                    child: Text('Precio: menor a mayor'),
                  ),
                  PopupMenuItem(
                    value: PriceOrder.descending,
                    child: Text('Precio: mayor a menor'),
                  ),
                ],
              );

              if (selected != null) {
                _handleSort(selected);
              }
            },
            icon: const Icon(Icons.filter_list),
          ),
        ],
      ),

      body: _HomeView(
        booksState: booksState,
        scrollController: scrollController,
      ),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({required this.booksState, required this.scrollController});

  final BooksState booksState;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    if (booksState.failure != null) {
      return _ErrorView(failure: UnknownFailure('Error', -1));
    }

    if (booksState.books.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: DsCustomGrid(
              scrollController: scrollController,
              items: booksState.books,
              itemBuilder: (_, book) {
                return DsItemCard(
                  imageUrl: book.image,
                  title: book.title,
                  price: book.price.toString(),
                  onTap: () => context.pushNamed(
                    BookDetailsScreen.routeName,
                    pathParameters: {'isbn13': book.isbn13},
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.failure});

  final Failure failure;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 40,
            color: DsColorsFoundations.errorColor,
          ),
          const SizedBox(height: DsSpacing.spaceSM),
          Text(
            failure.message,
            style: textTheme.labelMedium?.copyWith(
              color: DsColorsFoundations.errorColor,
            ),
          ),
        ],
      ),
    );
  }
}
