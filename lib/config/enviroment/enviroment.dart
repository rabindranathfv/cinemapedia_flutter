import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  static String theMovieDBKey =
      dotenv.get('THE_MOVIEDB_KEY', fallback: 'add valid api key');
  static String env = dotenv.env['ENV'] ?? 'dev';
  static String port = dotenv.get('PORT', fallback: '5500');
}
