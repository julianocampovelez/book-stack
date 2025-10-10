import 'package:flutter/material.dart';

import 'package:app/core/router/app_router.dart';

class BookStackApp extends StatelessWidget {
  const BookStackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'BookStack',
      routerConfig: appRouter,
    );
  }
}
