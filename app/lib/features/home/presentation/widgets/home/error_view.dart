import 'package:flutter/material.dart';

import 'package:app/core/network/errors/failures.dart';
import 'package:design_system/design_system.dart';

// A widget to display an error message when a failure occurs
class ErrorView extends StatelessWidget {
  const ErrorView({super.key, required this.failure});

  final Failure failure;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 40,
            color: DsColorsFoundations.errorColor,
          ),
          const SizedBox(height: DsSpacing.spaceSM),
          Text(
            failure.message,
            style: textTheme.labelMedium?.copyWith(
              color: DsColorsFoundations.errorColor,
            ),
          ),
        ],
      ),
    );
  }
}
