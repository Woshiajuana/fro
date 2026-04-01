import 'package:flutter/material.dart';

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
