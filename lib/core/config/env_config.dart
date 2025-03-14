import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  final String apiKey;

  EnvConfig({
    required this.apiKey,
  });

  static Future<EnvConfig> create() async {
    await dotenv.load(fileName: ".env");
    return EnvConfig(
      apiKey: dotenv.env['API_KEY'] ?? '',
    );
  }
}
