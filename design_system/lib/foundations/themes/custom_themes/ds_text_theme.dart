import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:design_system/tokens/typography.dart';

/// Custom text themes for light and dark modes.
class DsTextTheme {
  DsTextTheme._();

  /// Light mode text theme
  static TextTheme lightTextTheme = TextTheme(
    bodyLarge: TextStyle(
      fontSize: DsTypoFoundations.fontSizeBody, // 16
      fontWeight: FontWeight.w400,
      color: DsColorsFoundations.lightTextColor,
    ),

    bodyMedium: TextStyle(
      fontSize: DsTypoFoundations.fontSizeH5, // 14
      fontWeight: FontWeight.w400,
      color: DsColorsFoundations.lightTextColor,
    ),

    bodySmall: TextStyle(
      fontSize: DsTypoFoundations.fontSizeH6, // 12
      fontWeight: FontWeight.w400,
      color: DsColorsFoundations.lightTextColor,
    ),

    titleLarge: TextStyle(
      fontSize: DsTypoFoundations.fontSizeH2, // 24
      fontWeight: FontWeight.w700,
      color: DsColorsFoundations.lightTextColor,
    ),

    titleMedium: TextStyle(
      fontSize: DsTypoFoundations.fontSizeH3, // 20
      fontWeight: FontWeight.w600,
      color: DsColorsFoundations.lightTextColor,
    ),

    titleSmall: TextStyle(
      fontSize: DsTypoFoundations.fontSizeH4, // 16
      fontWeight: FontWeight.w500,
      color: DsColorsFoundations.lightTextColor,
    ),

    labelLarge: TextStyle(
      fontSize: DsTypoFoundations.fontSizeH5, // 14
      fontWeight: FontWeight.w600,
      color: DsColorsFoundations.lightTextColor,
    ),

    labelMedium: TextStyle(
      fontSize: DsTypoFoundations.fontSizeH6, // 12
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
      fontSize: DsTypoFoundations.fontSizeBody,
      fontWeight: FontWeight.w400,
      color: DsColorsFoundations.darkTextColor,
    ),

    bodyMedium: TextStyle(
      fontSize: DsTypoFoundations.fontSizeH5,
      fontWeight: FontWeight.w400,
      color: DsColorsFoundations.darkTextColor,
    ),

    bodySmall: TextStyle(
      fontSize: DsTypoFoundations.fontSizeH6,
      fontWeight: FontWeight.w400,
      color: DsColorsFoundations.darkTextColor,
    ),

    titleLarge: TextStyle(
      fontSize: DsTypoFoundations.fontSizeH2,
      fontWeight: FontWeight.w700,
      color: DsColorsFoundations.darkTextColor,
    ),

    titleMedium: TextStyle(
      fontSize: DsTypoFoundations.fontSizeH3,
      fontWeight: FontWeight.w600,
      color: DsColorsFoundations.darkTextColor,
    ),

    titleSmall: TextStyle(
      fontSize: DsTypoFoundations.fontSizeH4,
      fontWeight: FontWeight.w500,
      color: DsColorsFoundations.darkTextColor,
    ),

    labelLarge: TextStyle(
      fontSize: DsTypoFoundations.fontSizeH5,
      fontWeight: FontWeight.w600,
      color: DsColorsFoundations.darkTextColor,
    ),

    labelMedium: TextStyle(
      fontSize: DsTypoFoundations.fontSizeH6,
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
