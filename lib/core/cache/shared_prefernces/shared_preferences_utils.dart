import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class SharedPreferencesUtils {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  //todo: save data
  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is int) {
      return await _prefs.setInt(key, value);
    } else if (value is double) {
      return await _prefs.setDouble(key, value);
    } else if (value is String) {
      return await _prefs.setString(key, value);
    } else if (value is List<String>) {
      return await _prefs.setStringList(key, value);
    } else {
      return await _prefs.setBool(key, value);
    }
  }

  //todo: get data
  Object? getData({required String key}) {
    return _prefs.get(key);
  }

  //todo:remove data
  Future<bool> removeData({required String key}) async {
    return await _prefs.remove(key);
  }
}
