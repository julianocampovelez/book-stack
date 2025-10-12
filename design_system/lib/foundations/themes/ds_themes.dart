import 'package:flutter/material.dart';

import 'package:design_system/foundations/themes/custom_themes/ds_text_selection_theme.dart';
import 'package:design_system/foundations/themes/custom_themes/ds_text_theme.dart';

final ThemeData lightThemeDs = ThemeData(
  primaryColor: Color(0xfff95b1c),
  scaffoldBackgroundColor: Colors.white,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    centerTitle: false,
    backgroundColor: Color(0xfff95b1c),
    foregroundColor: Colors.white70,
  ),
  textSelectionTheme: DsTextSelectionTheme.textSelectionThemeDefault,
  textTheme: DsTextTheme.lightTextTheme,
);

final ThemeData darkThemeDs = ThemeData(
  primaryColor: Color(0xfff95b1c),
  scaffoldBackgroundColor: Colors.black87,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    centerTitle: false,
    backgroundColor: Color(0xfff95b1c),
    foregroundColor: Colors.white70,
  ),
  textSelectionTheme: DsTextSelectionTheme.textSelectionThemeDefault,
  textTheme: DsTextTheme.darkTextTheme,
);
