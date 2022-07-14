import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<SharedPreferences> prefs() {
    Future<SharedPreferences> prefs = SharedPreferences.getInstance();
    return prefs;
  }

  static GetStorage getStorage() {
    return GetStorage('FINDME');
  }
}
