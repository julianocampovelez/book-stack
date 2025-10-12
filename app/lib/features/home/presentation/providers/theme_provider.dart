import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

final StateNotifierProvider<ThemeNotifier, ThemeMode> themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, ThemeMode>((_) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.light);

  void toggleThemeMode() {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}
