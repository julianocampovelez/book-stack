import 'package:app/book_stack_app.dart';
import 'package:app/core/env/config_env.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigEnv.loadEnvironment();
  runApp(const BookStackApp());
}
