import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:app/features/home/presentation/screens/screens.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.routeName,
      builder: (BuildContext context, GoRouterState state) =>
          const HomeScreen(),
      routes: [
        GoRoute(
          path: 'book/:isbn13',
          name: BookDetailsScreen.routeName,
          builder: (context, state) {
            final String isbn13 = state.pathParameters['isbn13'] ?? 'no-isbn13';
            return BookDetailsScreen(isbn13: isbn13);
          },
        ),
      ],
    ),
  ],
);
