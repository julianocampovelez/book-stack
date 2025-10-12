import 'package:design_system/tokens/colors.dart';
import 'package:flutter/material.dart';

class DsColorsFoundations {
  DsColorsFoundations._();

  static const Color primaryColor = DsColors.primaryColor;
  static const Color secondaryColor = DsColors.secondaryColor;

  static const Color bgDark = DsColors.dark;
  static const Color darkTextColor = DsColors.scale00;
  static const Color lightTextColor = DsColors.dark;

  static const Color bgLight = DsColors.light;

  /// Card colors
  static const Color cardBgLight = DsColors.scale00;
  static const Color cardBgDark = DsColors.scale04;
  static const Color cardBorderLight = DsColors.scale02;
  static const Color cardBorderDark = DsColors.scale05;
  static const Color cardTextLight = DsColors.dark;
  static const Color cardTextDark = DsColors.scale00;

  /// Image colors
  /// Used as a placeholder background color for images
  static const Color imagePlaceholderBgLight = DsColors.scale01;
  static const Color imagePlaceholderBgDark = DsColors.scale05;
}
