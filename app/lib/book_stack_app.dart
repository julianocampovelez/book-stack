import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app/core/router/app_router.dart';
import 'package:app/core/themes/app_themes.dart';
import 'package:app/features/home/presentation/providers/providers.dart';

class BookStackApp extends ConsumerWidget {
  const BookStackApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeMode themeMode = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'BookStack',
      routerConfig: appRouter,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: themeMode,
    );
  }
}
