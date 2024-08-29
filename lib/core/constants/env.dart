import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  Env._();
  static String? androidApiKey = dotenv.env['ANDROID_APIKEY'];
  static String? iosApiKey = dotenv.env['IOS_APIKEY'];
  static String? appDb = dotenv.env['APP_DB'];
}
