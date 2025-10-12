import 'package:flutter/material.dart';

import 'package:design_system/design_system.dart';
import 'package:design_system/foundations/colors.dart';

/// A card widget that displays an item with an image, title, and price.
class DsItemCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final VoidCallback? onTap;

  const DsItemCard({
    super.key,

    /// The URL of the image to display at the top of the card.
    required this.imageUrl,

    /// The title text displayed below the image.
    required this.title,

    /// The price text displayed below the title.
    required this.price,

    /// The callback function triggered when the card is tapped.
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final TextTheme textTheme = Theme.of(context).textTheme;

    final BoxDecoration boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      color: isDark
          ? DsColorsFoundations.imagePlaceholderBgDark
          : DsColorsFoundations.imagePlaceholderBgLight,
    );

    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 0,
        color: isDark
            ? DsColorsFoundations.cardBgDark
            : DsColorsFoundations.cardBgLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: isDark
                ? DsColorsFoundations.cardBorderDark
                : DsColorsFoundations.cardBorderLight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                decoration: boxDecoration,
                child: DsNetworkImage(url: imageUrl),
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
                    style: textTheme.bodySmall,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '\$$price',
                    style: textTheme.labelLarge?.copyWith(
                      color: DsColorsFoundations.primaryColor,
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
