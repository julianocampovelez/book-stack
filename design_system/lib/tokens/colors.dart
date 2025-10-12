import 'package:flutter/material.dart';

/// A class containing the color palette used throughout the app.
class DsColors {
  DsColors._(); // Private constructor to prevent instantiation.

  /// The primary dark color of the app.
  static const dark = Colors.black87;

  /// The primary light color of the app.
  static const light = Colors.white;

  /// The primary brand color of the app.
  static const primaryColor = Color(0xfff95b1c);

  /// The secondary brand color of the app.
  static const secondaryColor = Color(0xffff7a00);

  /// The color used to indicate an error state.
  static const statusError = Color.fromRGBO(232, 56, 56, 1);

  // Grayscale color palette

  /// White (used for backgrounds, etc.).
  static const scale00 = Color(0xFFFFFFFF);

  /// Light gray (used for borders, etc.).
  static const scale01 = Color(0xFFC9C9C9);

  /// Lighter medium gray (used for text, borders, etc.).
  static const scale02 = Color(0xFF484848);

  // /// Medium gray (used for text or icons that need more contrast).
  // static const scale03 = Color(0xFF747779);

  // /// Darker medium gray (used for text or icons that need high contrast).
  // static const scale04 = Color(0xFF808285);

  // /// Gray (used for text or icons needing strong contrast on a light background).
  // static const scale05 = Color(0xFF454648);

  // /// Black (used for text or icons needing maximum contrast).
  // static const scale06 = Color(0xFF292929);
}
