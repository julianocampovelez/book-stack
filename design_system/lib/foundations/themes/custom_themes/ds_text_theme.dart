import 'package:flutter/material.dart';

import 'package:design_system/foundations/colors.dart';
import 'package:design_system/tokens/typography.dart';

class DsTextTheme {
  DsTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    bodyLarge: TextStyle().copyWith(
      fontSize: DsTypography.h3,
      fontWeight: FontWeight.w400,
      color: DsColorsFoundations.lightTextColor,
    ),
    bodyMedium: TextStyle().copyWith(
      fontSize: DsTypography.h4,
      fontWeight: FontWeight.w400,
      color: DsColorsFoundations.lightTextColor,
    ),
    bodySmall: TextStyle().copyWith(
      fontSize: DsTypography.h5,
      fontWeight: FontWeight.w400,
      color: DsColorsFoundations.lightTextColor,
    ),
    titleLarge: TextStyle().copyWith(
      fontSize: DsTypography.h1,
      fontWeight: FontWeight.w600,
      color: DsColorsFoundations.lightTextColor,
    ),
    titleMedium: TextStyle().copyWith(
      fontSize: DsTypography.h5,
      fontWeight: FontWeight.w500,
      color: DsColorsFoundations.lightTextColor,
    ),
    titleSmall: TextStyle().copyWith(
      fontSize: DsTypography.h3,
      fontWeight: FontWeight.w500,
      color: DsColorsFoundations.lightTextColor,
    ),
    labelLarge: TextStyle().copyWith(
      fontSize: DsTypography.h4,
      fontWeight: FontWeight.w600,
      color: DsColorsFoundations.lightTextColor,
    ),
    labelMedium: TextStyle().copyWith(
      fontSize: DsTypography.h5,
      fontWeight: FontWeight.w600,
      color: DsColorsFoundations.lightTextColor,
    ),
    labelSmall: TextStyle().copyWith(
      fontSize: DsTypography.h6,
      fontWeight: FontWeight.w600,
      color: DsColorsFoundations.lightTextColor,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyLarge: TextStyle().copyWith(
      fontSize: DsTypography.h3,
      fontWeight: FontWeight.w400,
      color: DsColorsFoundations.darkTextColor,
    ),
    bodyMedium: TextStyle().copyWith(
      fontSize: DsTypography.h4,
      fontWeight: FontWeight.w400,
      color: DsColorsFoundations.darkTextColor,
    ),
    bodySmall: TextStyle().copyWith(
      fontSize: DsTypography.h5,
      fontWeight: FontWeight.w400,
      color: DsColorsFoundations.darkTextColor,
    ),
    titleLarge: TextStyle().copyWith(
      fontSize: DsTypography.h1,
      fontWeight: FontWeight.w600,
      color: DsColorsFoundations.darkTextColor,
    ),
    titleMedium: TextStyle().copyWith(
      fontSize: DsTypography.h5,
      fontWeight: FontWeight.w500,
      color: DsColorsFoundations.darkTextColor,
    ),
    titleSmall: TextStyle().copyWith(
      fontSize: DsTypography.h3,
      fontWeight: FontWeight.w500,
      color: DsColorsFoundations.darkTextColor,
    ),
    labelLarge: TextStyle().copyWith(
      fontSize: DsTypography.h4,
      fontWeight: FontWeight.w600,
      color: DsColorsFoundations.darkTextColor,
    ),
    labelMedium: TextStyle().copyWith(
      fontSize: DsTypography.h5,
      fontWeight: FontWeight.w600,
      color: DsColorsFoundations.darkTextColor,
    ),
    labelSmall: TextStyle().copyWith(
      fontSize: DsTypography.h6,
      fontWeight: FontWeight.w600,
      color: DsColorsFoundations.darkTextColor,
    ),
  );
}
