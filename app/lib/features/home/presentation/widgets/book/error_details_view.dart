import 'package:flutter/material.dart';

import 'package:design_system/foundations/colors.dart';
import 'package:app/core/network/errors/failures.dart';

class ErrorDetailsView extends StatelessWidget {
  final Failure failure;
  const ErrorDetailsView({super.key, required this.failure});

  Color _colorThemeData(bool isDark) {
    return isDark
        ? DsColorsFoundations.darkTextColor
        : DsColorsFoundations.lightTextColor;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error_outline, color: _colorThemeData(isDark), size: 40),
          const SizedBox(height: 8),
          Text(
            failure.message,
            style: TextStyle(color: _colorThemeData(isDark), fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
