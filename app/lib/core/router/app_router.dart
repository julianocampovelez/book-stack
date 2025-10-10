import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:app/features/home/presentation/screens/screens.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) =>
          const HomeScreen(),
    ),
  ],
);
