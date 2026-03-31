import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class FroSp {
  FroSp._();
  factory FroSp() => _instance;
  static final FroSp _instance = FroSp._();

  static late SharedPreferences _prefs;
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// 设置
  Future<void> setItem(String key, dynamic value) async {
    await _prefs.setString(key, jsonEncode(value));
  }

  /// 获取
  dynamic getItem(String key) {
    var value = _prefs.get(key);

    try {
      value = jsonDecode(value.toString());
    } catch (_) {}

    return value;
  }

  /// 删除
  Future<bool> removeItem(String key) async {
    return _prefs.remove(key);
  }

  /// 清空
  Future<bool> clear() async {
    return _prefs.clear();
  }
}
