import 'package:flutter/material.dart';
import 'package:fro/fro/utils/index.dart';

class AppThemeProvider extends ChangeNotifier {
  AppThemeProvider()
    : _themeMode = _parseThemeMode(
        _themeModeStorage.getItem(ThemeMode.system.name),
      );

  static final FroStorage<String> _themeModeStorage = FroStorage<String>(
    key: 'theme.mode',
    initialValue: ThemeMode.system.name,
  );

  ThemeMode _themeMode;

  ThemeMode get themeMode => _themeMode;

  Future<void> setThemeMode(ThemeMode mode) async {
    if (_themeMode == mode) {
      return;
    }
    _themeMode = mode;
    notifyListeners();
    await _themeModeStorage.setItem(mode.name);
  }

  Future<void> useSystem() => setThemeMode(ThemeMode.system);

  Future<void> useLight() => setThemeMode(ThemeMode.light);

  Future<void> useDark() => setThemeMode(ThemeMode.dark);

  static ThemeMode _parseThemeMode(String value) {
    switch (value) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}

class AppTheme {
  AppTheme._();

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
