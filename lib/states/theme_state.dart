import 'package:flutter/material.dart';

class ThemeState extends ChangeNotifier {
  /// 主题模式
  late String _themeModeName;
  String get themeModeName => _themeModeName;

  // 主题模式
  ThemeMode get themeMode {
    if (_themeModeName == 'light') {
      return ThemeMode.light;
    } else if (_themeModeName == 'dark') {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }
}
