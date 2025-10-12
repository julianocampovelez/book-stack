import 'package:flutter/material.dart';

/// A widget that displays an image from a network URL.
class DsNetworkImage extends StatelessWidget {
  /// The URL of the network image.
  final String url;

  /// The desired width of the image.
  final double width;

  /// The desired height of the image.
  final double height;

  /// Creates a widget that displays an image from a network URL.
  const DsNetworkImage({
    super.key,
    required this.url,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    Widget dsNetworkImage = Image.network(url, width: width, height: height);
    return dsNetworkImage;
  }
}
