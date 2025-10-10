import 'package:flutter_dotenv/flutter_dotenv.dart';

class ConfigEnv {
  static String get itbookApiUrl => dotenv.env['ITBOOK_API_URL'] ?? '';

  static Future<void> loadEnvironment({String fileName = ".env"}) async {
    await dotenv.load(fileName: fileName);
  }
}
