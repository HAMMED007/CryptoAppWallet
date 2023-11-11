import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsController extends GetxController {
  late SharedPreferences prefs;
  @override
  Future<void> onInit() async {
    prefs = await SharedPreferences.getInstance();

    super.onInit();
  }

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  bool getBool(String itemId) => prefs.getBool(itemId) ?? false;

  String getString(String id) => prefs.getString(id) ?? "";

  setBool(String itemId, bool value) => prefs.setBool(itemId, value);

  setString(String key, String value) => prefs.setString(key, value);

  removeString(String key) => prefs.remove(key);
  clear() => prefs.clear();
}
