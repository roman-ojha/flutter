import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get fileName {
    if (kReleaseMode) {
      // when we are in a production or in a release mode then we have to load this
      return ".env.production";
    }
    return ".env.development";
  }

  static String get apiUrl {
    return dotenv.env['API_URL'] ?? "API_URL not found";
  }
}
