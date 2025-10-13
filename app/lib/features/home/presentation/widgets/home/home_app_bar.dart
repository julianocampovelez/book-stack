import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:app/features/home/domain/entities/entities.dart';
import 'package:app/features/home/presentation/delegates/search_book_delegate.dart';
import 'package:app/features/home/presentation/providers/providers.dart';
import 'package:app/features/home/presentation/screens/book_screen.dart';
import 'package:app/features/home/presentation/state/sort_provider.dart';
import 'package:design_system/design_system.dart';

// Custom AppBar for the Home Screen
class HomeAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key, required this.handleSort});

  // Callback to handle sorting action
  final VoidCallback handleSort;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text('Book Stack'),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              DsColorsFoundations.primaryColor,
              DsColorsFoundations.secondaryColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
      actions: [
        // Theme toggle button
        DsIconButton(
          icon: Icon(
            Theme.of(context).brightness == Brightness.dark
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined,
          ),
          onPressed: () =>
              ref.read(themeNotifierProvider.notifier).toggleThemeMode(),
        ),

        // Search button
        DsIconButton(
          icon: const Icon(Icons.search),
          onPressed: () async {
            // Open the search delegate and await the selected book
            final Book? book = await showSearch<Book?>(
              context: context,
              delegate: SearchBookDelegate(
                searchBooks: ref.read(booksRepositoryProvider).searchBooks,
              ),
            );

            if (!context.mounted || book == null) return;

            // Navigate to the book details screen with the selected book's ISBN13
            context.pushNamed(
              BookDetailsScreen.routeName,
              pathParameters: {'isbn13': book.isbn13},
            );
          },
        ),

        // Sort button
        DsIconButton(
          icon: const Icon(Icons.filter_list),
          onPressed: () async {
            final selected = await showMenu<PriceOrder>(
              context: context,
              position: const RelativeRect.fromLTRB(3000, 80, 16, 0),
              items: const [
                PopupMenuItem(
                  value: PriceOrder.ascending,
                  child: Text('Precio (menor a mayor)'),
                ),
                PopupMenuItem(
                  value: PriceOrder.descending,
                  child: Text('Precio (mayor a menor)'),
                ),
              ],
            );

            if (selected != null) {
              handleSort();
              ref.read(programmingBooksProvider.notifier).sortByPrice(selected);
            }
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
