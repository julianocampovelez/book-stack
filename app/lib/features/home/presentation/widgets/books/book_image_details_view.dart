import 'package:flutter/material.dart';

import 'package:app/features/home/domain/entities/book.dart';
import 'package:design_system/design_system.dart';

class BookImageView extends StatelessWidget {
  final Book book;
  const BookImageView({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(child: DsNetworkImage(url: book.image)),

        DsCustomGradient(
          colors: [Colors.transparent, Colors.black45],
          stops: [0.7, 1.0],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),

        DsCustomGradient(
          colors: [Colors.black87, Colors.transparent],
          stops: [0.0, 0.3],
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
        ),
      ],
    );
  }
}
