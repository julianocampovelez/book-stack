import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Provides access to environment configuration values defined in a `.env` file.
///
/// This class centralizes environment variable management,
/// making it easier to load and access configuration values
/// such as API URLs or keys throughout the app.
class ConfigEnv {
  static String get itbookApiUrl => dotenv.env['ITBOOK_API_URL'] ?? '';

  /// Loads environment variables from the specified `.env` file.
  ///
  /// By default, it loads variables from a file named `.env`
  /// located at the project’s root directory.
  static Future<void> loadEnvironment({String fileName = ".env"}) async {
    await dotenv.load(fileName: fileName);
  }
}
