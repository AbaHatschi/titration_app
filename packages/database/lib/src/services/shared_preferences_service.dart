import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  Future<void> saveString(String key, String value) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString(key, value);
  }

  Future<String?> getString(String key) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return sharedPreferences.getString(key);
  }

  Future<void> remove(String key) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.remove(key);
  }

  Future<void> clear() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}
