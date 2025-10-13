import 'package:flutter/material.dart';

import 'package:design_system/design_system.dart';

class ScoreStars extends StatelessWidget {
  const ScoreStars({super.key, required this.score, required this.onTap});

  final int score;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Tu calificación: '),

        ...List.generate(5, (index) {
          final int ratingValue = (index + 1);
          final bool isFilled = ratingValue <= score;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: GestureDetector(
              onTap: () => onTap(ratingValue),
              child: Icon(
                isFilled ? Icons.star : Icons.star_border,
                color: DsColorsFoundations.starColor,
              ),
            ),
          );
        }),
      ],
    );
  }
}
