import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> setString(String key, String value) async {
    SharedPreferences prefs = await _prefs;
    if (value != null && value.isNotEmpty) {
      prefs.setString(key, value);
    }
  }

  Future<String> getString(String key) async {
    SharedPreferences prefs = await _prefs;
    String val = "";
    if (prefs.containsKey(key)) {
      val = prefs.getString(key)!;
    }

    return val;
  }

  Future<bool> checkKey(String key) async {
    SharedPreferences prefs = await _prefs;
    return prefs.containsKey(key);
  }

  Future<bool> remove(String key) async {
    SharedPreferences prefs = await _prefs;
    return prefs.remove(key);
  }

  Future<void> clearLocalData() async {
    SharedPreferences prefs = await _prefs;
    await prefs.clear();
  }
}
