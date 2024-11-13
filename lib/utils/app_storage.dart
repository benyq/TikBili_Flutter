import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {

  static late SharedPreferencesWithCache _prefsWithCache;

  static init() async {
    _prefsWithCache = await SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(
        // When an allowlist is included, any keys that aren't included cannot be used.
        // allowList: <String>{'repeat', 'action'},
      ),
    );
  }

  static String getString(String key) {
    return _prefsWithCache.getString(key) ?? "";
  }

  static Future<void> setString(String key, String value) {
    return _prefsWithCache.setString(key, value);
  }
}