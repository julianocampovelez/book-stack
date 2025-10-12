import 'package:flutter/material.dart';

/// A customizable grid widget that displays a list of items using a provided item builder.
class DsCustomGrid<T> extends StatelessWidget {
  const DsCustomGrid({
    super.key,

    /// The scroll controller for the grid view.
    required this.scrollController,

    /// The list of items to display in the grid.
    required this.items,

    /// The builder function for creating each grid item.
    required this.itemBuilder,
  });

  final ScrollController scrollController;
  final List<T> items;
  final Widget Function(BuildContext context, T item) itemBuilder;

  @override
  Widget build(BuildContext context) {
    Widget dsCustomGrid = GridView.builder(
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

    return dsCustomGrid;
  }
}
