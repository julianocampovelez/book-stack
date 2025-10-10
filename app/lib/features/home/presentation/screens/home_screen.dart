import 'package:app/features/home/presentation/screens/screens.dart';
import 'package:app/features/home/presentation/state/sort_books_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app/features/home/presentation/providers/books_provider.dart';
import 'package:app/features/home/presentation/state/books_state.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const String routeName = '/homeScreen';
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_onScrollEnd);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(programmingBooksProvider.notifier).loadNextPage();
    });
  }

  void _onScrollEnd() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 100) {
      ref.read(programmingBooksProvider.notifier).loadNextPage();
    }
  }

  void handleSort(PriceOrder order) async {
    await _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    ref.read(programmingBooksProvider.notifier).sortByPrice(order);
  }

  @override
  Widget build(BuildContext context) {
    final BooksState booksState = ref.watch(programmingBooksProvider);
    final PriceOrder currentSortOrder = ref.watch(sortBooksProvider);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF6366F1), // Indigo-500
                Color(0xFF8B5CF6), // Violet-500
              ],
            ),
          ),
        ),
        centerTitle: false,
        title: const Text(
          'Book Stack',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            tooltip: 'Modo oscuro/claro',
            onPressed: () {},
            icon: const Icon(Icons.light_mode_outlined, color: Colors.white),
          ),
          IconButton(
            tooltip: 'Buscar',
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.white),
          ),

          IconButton(
            tooltip: 'Ordenar',
            onPressed: () async {
              final selected = await showMenu<PriceOrder>(
                initialValue: currentSortOrder,
                context: context,
                position: const RelativeRect.fromLTRB(
                  3000,
                  80,
                  16,
                  0,
                ), // posición del popup
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
                handleSort(selected);
              }
            },
            icon: const Icon(Icons.filter_list, color: Colors.white),
          ),

          const SizedBox(width: 8),
        ],
      ),
      body: Builder(
        builder: (context) {
          if (booksState.failure != null) {
            return Center(
              child: Text(
                'Error: ${booksState.failure!.message}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          if (booksState.books.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Explora nuestra selección',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: GridView.builder(
                    controller: _scrollController,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: 0.68,
                        ),
                    itemCount: booksState.books.length,
                    itemBuilder: (context, index) {
                      final item = booksState.books[index];
                      return _BookCard(
                        imageUrl: item.image,
                        title: item.title,
                        price: item.price.toString(),
                        onTap: () => context.pushNamed(
                          BookDetailsScreen.routeName,
                          pathParameters: {'isbn13': item.isbn13},
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _BookCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final VoidCallback onTap;

  const _BookCard({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 4 / 3,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    color: Colors.grey[200],
                    child: const Center(
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[200],
                  child: const Icon(Icons.broken_image, color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Colors.green[700],
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
