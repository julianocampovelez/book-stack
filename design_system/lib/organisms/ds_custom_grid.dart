import 'package:flutter/material.dart';

class DsCustomGrid<T> extends StatelessWidget {
  const DsCustomGrid({
    super.key,
    required this.scrollController,
    required this.items,
    required this.itemBuilder,
  });

  final ScrollController scrollController;
  final List<T> items;
  final Widget Function(BuildContext context, T item) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: scrollController,
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 0.6,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return itemBuilder(context, item);
      },
    );
  }
}
