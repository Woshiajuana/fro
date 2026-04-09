import 'package:flutter/material.dart';
import 'package:fro/fro/widgets/cell/cell_group_theme.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    extensions: const [
      FroCellGroupTheme(
        backgroundColor: Colors.white,
        borderColor: Color(0xFFEAEAEA),
        dividerColor: Color(0xFFEAEAEA),
        titleColor: Color(0xFF969799),
      ),
    ],
    scaffoldBackgroundColor: const Color(0xFFF2F3F5),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF1989FA),
      brightness: Brightness.light,
    ),
  );

  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    extensions: const [
      FroCellGroupTheme(
        backgroundColor: Color(0xFF1C1C1E),
        borderColor: Color(0xFF2C2C2E),
        dividerColor: Color(0xFF2C2C2E),
        titleColor: Color(0xFF8E8E93),
      ),
    ],
    scaffoldBackgroundColor: const Color(0xFF111111),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF1989FA),
      brightness: Brightness.dark,
    ),
    bottomAppBarTheme: const BottomAppBarThemeData(color: Color(0xFF1C1C1E)),
  );
}
