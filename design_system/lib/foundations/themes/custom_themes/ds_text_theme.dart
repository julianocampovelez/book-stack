import 'package:flutter/material.dart';

import 'package:design_system/foundations/colors.dart';
import 'package:design_system/tokens/typography.dart';

/// Custom text themes for light and dark modes.
class DsTextTheme {
  DsTextTheme._();

  /// Light mode text theme
  static TextTheme lightTextTheme = TextTheme(
    bodyLarge: TextStyle(
      fontSize: DsTypography.body, // 16
      fontWeight: FontWeight.w400,
      color: DsColorsFoundations.lightTextColor,
    ),

    bodyMedium: TextStyle(
      fontSize: DsTypography.h5, // 14
      fontWeight: FontWeight.w400,
      color: DsColorsFoundations.lightTextColor,
    ),

    bodySmall: TextStyle(
      fontSize: DsTypography.h6, // 12
      fontWeight: FontWeight.w400,
      color: DsColorsFoundations.lightTextColor,
    ),

    titleLarge: TextStyle(
      fontSize: DsTypography.h2, // 24
      fontWeight: FontWeight.w700,
      color: DsColorsFoundations.lightTextColor,
    ),

    titleMedium: TextStyle(
      fontSize: DsTypography.h3, // 20
      fontWeight: FontWeight.w600,
      color: DsColorsFoundations.lightTextColor,
    ),

    titleSmall: TextStyle(
      fontSize: DsTypography.h4, // 16
      fontWeight: FontWeight.w500,
      color: DsColorsFoundations.lightTextColor,
    ),

    labelLarge: TextStyle(
      fontSize: DsTypography.h5, // 14
      fontWeight: FontWeight.w600,
      color: DsColorsFoundations.lightTextColor,
    ),

    labelMedium: TextStyle(
      fontSize: DsTypography.h6, // 12
      fontWeight: FontWeight.w600,
      color: DsColorsFoundations.lightTextColor,
    ),

    labelSmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: DsColorsFoundations.lightTextColor,
    ),
  );

  /// Dark mode text theme
  static TextTheme darkTextTheme = TextTheme(
    bodyLarge: TextStyle(
      fontSize: DsTypography.body,
      fontWeight: FontWeight.w400,
      color: DsColorsFoundations.darkTextColor,
    ),

    bodyMedium: TextStyle(
      fontSize: DsTypography.h5,
      fontWeight: FontWeight.w400,
      color: DsColorsFoundations.darkTextColor,
    ),

    bodySmall: TextStyle(
      fontSize: DsTypography.h6,
      fontWeight: FontWeight.w400,
      color: DsColorsFoundations.darkTextColor,
    ),

    titleLarge: TextStyle(
      fontSize: DsTypography.h2,
      fontWeight: FontWeight.w700,
      color: DsColorsFoundations.darkTextColor,
    ),

    titleMedium: TextStyle(
      fontSize: DsTypography.h3,
      fontWeight: FontWeight.w600,
      color: DsColorsFoundations.darkTextColor,
    ),

    titleSmall: TextStyle(
      fontSize: DsTypography.h4,
      fontWeight: FontWeight.w500,
      color: DsColorsFoundations.darkTextColor,
    ),

    labelLarge: TextStyle(
      fontSize: DsTypography.h5,
      fontWeight: FontWeight.w600,
      color: DsColorsFoundations.darkTextColor,
    ),

    labelMedium: TextStyle(
      fontSize: DsTypography.h6,
      fontWeight: FontWeight.w600,
      color: DsColorsFoundations.darkTextColor,
    ),

    labelSmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: DsColorsFoundations.darkTextColor,
    ),
  );
}
