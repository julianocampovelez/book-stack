import 'package:flutter/material.dart';

import 'package:design_system/design_system.dart';

/// Custom text themes for light and dark modes.
class DsTextTheme {
  DsTextTheme._();

  /// Light mode text theme
  static TextTheme lightTextTheme = TextTheme(
    bodyLarge: TextStyle(
      fontSize: DsTypoFoundations.fontSizeBody, // 16
      fontFamily: DsTypography.familyOpenSans,
      fontWeight: FontWeight.w400,
      color: DsColorsFoundations.lightTextColor,
    ),

    bodyMedium: TextStyle(
      fontSize: DsTypoFoundations.fontSizeH5, // 14
      fontFamily: DsTypography.familyOpenSans,
      fontWeight: FontWeight.w400,
      color: DsColorsFoundations.lightTextColor,
    ),

    bodySmall: TextStyle(
      fontSize: DsTypoFoundations.fontSizeH6, // 12
      fontFamily: DsTypography.familyOpenSans,
      fontWeight: FontWeight.w400,
      color: DsColorsFoundations.lightTextColor,
    ),

    titleLarge: TextStyle(
      fontSize: DsTypoFoundations.fontSizeH2, // 24
      fontFamily: DsTypography.familyOpenSans,
      fontWeight: FontWeight.w700,
      color: DsColorsFoundations.lightTextColor,
    ),

    titleMedium: TextStyle(
      fontSize: DsTypoFoundations.fontSizeH3, // 20
      fontFamily: DsTypography.familyOpenSans,
      fontWeight: FontWeight.w600,
      color: DsColorsFoundations.lightTextColor,
    ),

    titleSmall: TextStyle(
      fontSize: DsTypoFoundations.fontSizeH4, // 16
      fontFamily: DsTypography.familyOpenSans,
      fontWeight: FontWeight.w500,
      color: DsColorsFoundations.lightTextColor,
    ),

    labelLarge: TextStyle(
      fontSize: DsTypoFoundations.fontSizeH5, // 14
      fontFamily: DsTypography.familyOpenSans,
      fontWeight: FontWeight.w600,
      color: DsColorsFoundations.lightTextColor,
    ),

    labelMedium: TextStyle(
      fontSize: DsTypoFoundations.fontSizeH6, // 12
      fontFamily: DsTypography.familyOpenSans,
      fontWeight: FontWeight.w600,
      color: DsColorsFoundations.lightTextColor,
    ),

    labelSmall: TextStyle(
      fontSize: 10,
      fontFamily: DsTypography.familyOpenSans,
      fontWeight: FontWeight.w500,
      color: DsColorsFoundations.lightTextColor,
    ),
  );

  /// Dark mode text theme
  static TextTheme darkTextTheme = TextTheme(
    bodyLarge: TextStyle(
      fontSize: DsTypoFoundations.fontSizeBody,
      fontFamily: DsTypography.familyOpenSans,
      fontWeight: FontWeight.w400,
      color: DsColorsFoundations.darkTextColor,
    ),

    bodyMedium: TextStyle(
      fontSize: DsTypoFoundations.fontSizeH5,
      fontFamily: DsTypography.familyOpenSans,
      fontWeight: FontWeight.w400,
      color: DsColorsFoundations.darkTextColor,
    ),

    bodySmall: TextStyle(
      fontSize: DsTypoFoundations.fontSizeH6,
      fontFamily: DsTypography.familyOpenSans,
      fontWeight: FontWeight.w400,
      color: DsColorsFoundations.darkTextColor,
    ),

    titleLarge: TextStyle(
      fontSize: DsTypoFoundations.fontSizeH2,
      fontFamily: DsTypography.familyOpenSans,
      fontWeight: FontWeight.w700,
      color: DsColorsFoundations.darkTextColor,
    ),

    titleMedium: TextStyle(
      fontSize: DsTypoFoundations.fontSizeH3,
      fontFamily: DsTypography.familyOpenSans,
      fontWeight: FontWeight.w600,
      color: DsColorsFoundations.darkTextColor,
    ),

    titleSmall: TextStyle(
      fontSize: DsTypoFoundations.fontSizeH4,
      fontFamily: DsTypography.familyOpenSans,
      fontWeight: FontWeight.w500,
      color: DsColorsFoundations.darkTextColor,
    ),

    labelLarge: TextStyle(
      fontSize: DsTypoFoundations.fontSizeH5,
      fontFamily: DsTypography.familyOpenSans,
      fontWeight: FontWeight.w600,
      color: DsColorsFoundations.darkTextColor,
    ),

    labelMedium: TextStyle(
      fontSize: DsTypoFoundations.fontSizeH6,
      fontFamily: DsTypography.familyOpenSans,
      fontWeight: FontWeight.w600,
      color: DsColorsFoundations.darkTextColor,
    ),

    labelSmall: TextStyle(
      fontSize: 10,
      fontFamily: DsTypography.familyOpenSans,
      fontWeight: FontWeight.w500,
      color: DsColorsFoundations.darkTextColor,
    ),
  );
}
