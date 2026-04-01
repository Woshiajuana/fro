import 'package:flutter/material.dart';
import 'package:fro/fro/utils/index.dart';

class ThemeState extends ChangeNotifier {
  ThemeState()
    : _themeModeName = _themeModeStorage.getItem(ThemeMode.system.name);

  static final _themeModeStorage = FroStorage<String>(
    key: 'app.theme.mode',
    initialValue: ThemeMode.system.name,
  );

  String _themeModeName;

  String get themeModeName => _themeModeName;

  ThemeMode get themeMode {
    if (_themeModeName == ThemeMode.light.name) {
      return ThemeMode.light;
    }
    if (_themeModeName == ThemeMode.dark.name) {
      return ThemeMode.dark;
    }
    return ThemeMode.system;
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    if (_themeModeName == mode.name) {
      return;
    }
    _themeModeName = mode.name;
    notifyListeners();
    await _themeModeStorage.setItem(_themeModeName);
  }

  Future<void> followSystem() => setThemeMode(ThemeMode.system);

  Future<void> useLight() => setThemeMode(ThemeMode.light);

  Future<void> useDark() => setThemeMode(ThemeMode.dark);
}
