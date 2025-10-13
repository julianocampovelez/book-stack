import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:app/features/home/presentation/providers/books/books_provider.dart';
import 'package:app/features/home/presentation/providers/providers.dart';
import 'package:app/features/home/presentation/screens/screens.dart';
import 'package:app/features/home/presentation/state/books_state.dart';
import 'package:app/features/home/presentation/widgets/widgets.dart';
import 'package:design_system/design_system.dart';

// The main screen displaying a list of programming books
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
  void _handleSort() async {
    await scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final BooksState booksState = ref.watch(programmingBooksProvider);

    return Scaffold(
      appBar: HomeAppBar(handleSort: _handleSort),
      body: _HomeView(
        booksState: booksState,
        scrollController: scrollController,
      ),
    );
  }
}

// The main view displaying the list of books or an error/loading state
class _HomeView extends StatelessWidget {
  const _HomeView({required this.booksState, required this.scrollController});

  final BooksState booksState;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    if (booksState.failure != null) {
      return ErrorView(failure: booksState.failure!);
    }

    if (booksState.books.isEmpty) {
      return const Center(child: DsCircularProgress());
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
