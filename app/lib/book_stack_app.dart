import 'package:flutter/material.dart';

class BookStackApp extends StatelessWidget {
  const BookStackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BookStack',
      home: const Scaffold(body: Center(child: Text('Welcome to BookStack!'))),
    );
  }
}
