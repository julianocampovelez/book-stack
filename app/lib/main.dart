import 'package:flutter/material.dart';

import 'package:app/book_stack_app.dart';
import 'package:app/core/env/config_env.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigEnv.loadEnvironment();

  runApp(ProviderScope(child: const BookStackApp()));
}
