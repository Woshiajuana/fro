import 'package:flutter/material.dart';
import 'package:fro/fro/widgets/cell/cell_theme.dart';
import 'package:fro/fro/widgets/cell/cell_group_theme.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFF2F3F5),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF1989FA),
      brightness: Brightness.light,
    ),
    extensions: const [
      FroCellTheme(
        backgroundColor: Colors.white,
        labelColor: Color(0xFF323233),
        descriptionColor: Color(0xFF969799),
        valueColor: Color(0xFF969799),
        leadingIconColor: Color(0xFF1989FA),
        arrowColor: Color(0xFFC8C9CC),
      ),
      FroCellGroupTheme(
        backgroundColor: Colors.white,
        borderColor: Color(0xFFEAEAEA),
        dividerColor: Color(0xFFEAEAEA),
        titleColor: Color(0xFF969799),
      ),
    ],
  );

  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF111111),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF1989FA),
      brightness: Brightness.dark,
    ),
    extensions: const [
      FroCellTheme(
        backgroundColor: Color(0xFF1C1C1E),
        labelColor: Color(0xFFF2F2F7),
        descriptionColor: Color(0xFF8E8E93),
        valueColor: Color(0xFFAEAEB2),
        leadingIconColor: Color(0xFF0A84FF),
        arrowColor: Color(0xFF636366),
      ),
      FroCellGroupTheme(
        backgroundColor: Color(0xFF1C1C1E),
        borderColor: Color(0xFF2C2C2E),
        dividerColor: Color(0xFF2C2C2E),
        titleColor: Color(0xFF8E8E93),
      ),
    ],
  );
}
