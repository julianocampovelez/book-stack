import 'package:flutter/material.dart';
import 'package:app/features/home/domain/entities/book.dart';

class BookImageView extends StatelessWidget {
  final Book book;
  const BookImageView({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: Image.network(
            book.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            errorBuilder: (_, __, ___) => const Center(
              child: Icon(Icons.broken_image, color: Colors.white54, size: 48),
            ),
            loadingBuilder: (context, child, progress) {
              if (progress == null) return child;
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            },
          ),
        ),

        _CustomGradient(
          colors: [Colors.transparent, Colors.black45],
          stops: [0.7, 1.0],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),

        _CustomGradient(
          colors: [Colors.black87, Colors.transparent],
          stops: [0.0, 0.3],
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
        ),
      ],
    );
  }
}

class _CustomGradient extends StatelessWidget {
  final List<Color> colors;
  final List<double> stops;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;

  const _CustomGradient({
    required this.colors,
    required this.stops,
    this.begin = Alignment.centerLeft,
    this.end = Alignment.centerLeft,
  }) : assert(
         colors.length == stops.length,
         "Length of the colors and the stops must be equal",
       );

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: begin,
            end: end,
            stops: stops,
            colors: colors,
          ),
        ),
      ),
    );
  }
}
