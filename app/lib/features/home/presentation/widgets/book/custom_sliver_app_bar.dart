import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app/core/network/errors/failures.dart';
import 'package:app/features/home/domain/entities/entities.dart';
import 'package:app/features/home/presentation/widgets/widgets.dart';

class CustomSliverAppBar extends ConsumerWidget {
  final bool isLoading;
  final Failure? failure;
  final Book? book;

  const CustomSliverAppBar({
    super.key,
    required this.isLoading,
    required this.failure,
    required this.book,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    Widget content;

    if (failure != null) {
      content = ErrorDetailsView(failure: failure!);
    } else if (isLoading || book == null) {
      content = const Center(
        child: CircularProgressIndicator(color: Color(0xfff95b1c)),
      );
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
