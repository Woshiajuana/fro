import 'package:flutter/material.dart';

class AppThemeController extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void setThemeMode(ThemeMode mode) {
    if (_themeMode == mode) {
      return;
    }
    _themeMode = mode;
    notifyListeners();
  }

  void useSystem() => setThemeMode(ThemeMode.system);

  void useLight() => setThemeMode(ThemeMode.light);

  void useDark() => setThemeMode(ThemeMode.dark);
}

class AppTheme {
  AppTheme._();

  static final AppThemeController controller = AppThemeController();

  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFF2F3F5),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF1989FA),
      brightness: Brightness.light,
    ),
  );

  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF111111),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF1989FA),
      brightness: Brightness.dark,
    ),
  );
}
