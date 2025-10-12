import 'package:flutter/material.dart';

/// A class containing the color palette used throughout the app.
class DsColors {
  DsColors._(); // Private constructor to prevent instantiation.

  /// The primary dark color of the app.
  static const dark = Colors.black87;

  /// The primary light color of the app.
  static const light = Colors.white;

  /// The primary brand color of the app.
  static const primaryColor = Color(0xFFF95B1C);

  /// The secondary brand color of the app.
  static const secondaryColor = Color(0xFFFF7A00);

  /// The color used to indicate an error state.
  static const statusError = Color.fromRGBO(232, 56, 56, 1);

  /// The color used for stars.
  static const amber = Colors.amber;

  // Grayscale color palette
  /// White (used for backgrounds, etc.).
  static const scale00 = Color(0xFFFFFFFF);

  /// Very light gray (used for backgrounds, etc.).
  static const scale01 = Color(0xFFEEEEEE);

  /// Light gray (used for borders, etc.).
  static const scale02 = Color(0xFFC9C9C9);

  /// Medium gray (used for disabled text, icons, etc.).
  static const scale03 = Color(0xFF9E9E9E);

  /// Lighter medium gray (used for text, borders, etc.).
  static const scale04 = Color(0xFF484848);

  /// Dark gray (used for text or icons needing strong contrast on a light background).
  static const scale05 = Color(0xFF262626);
}
