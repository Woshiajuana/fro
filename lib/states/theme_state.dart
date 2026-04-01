import 'package:flutter/material.dart';
import 'package:fro/fro/utils/index.dart';

class ThemeState extends ChangeNotifier {
  ThemeState()
    : _themeModeName = _themeModeStorage.getItem(ThemeMode.system.name);

  static final FroStorage<String> _themeModeStorage = FroStorage<String>(
    key: 'app.theme.mode',
    initialValue: ThemeMode.system.name,
  );

  String _themeModeName;

  String get themeModeName => _themeModeName;

  ThemeMode get themeMode {
    switch (_themeModeName) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    if (_themeModeName == mode.name) {
      return;
    }
    _themeModeName = mode.name;
    notifyListeners();
    await _themeModeStorage.setItem(_themeModeName);
  }

  Future<void> useSystem() => setThemeMode(ThemeMode.system);

  Future<void> useLight() => setThemeMode(ThemeMode.light);

  Future<void> useDark() => setThemeMode(ThemeMode.dark);
}
