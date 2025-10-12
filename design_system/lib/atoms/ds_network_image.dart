import 'package:flutter/material.dart';

import 'package:design_system/design_system.dart';

/// A widget that displays an image from a network URL.
class DsNetworkImage extends StatelessWidget {
  /// The URL of the network image.
  final String url;

  /// Creates a widget that displays an image from a network URL.
  const DsNetworkImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    Widget dsNetworkImage = Image.network(
      url,
      fit: BoxFit.cover,
      loadingBuilder: (_, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return const Center(
          child: SizedBox(
            width: 24,
            height: 24,
            child: DsCircularProgress(strokeWidth: 2.0),
          ),
        );
      },
      errorBuilder: (_, __, ___) =>
          const Icon(Icons.broken_image, color: Colors.grey),
    );

    return dsNetworkImage;
  }
}
