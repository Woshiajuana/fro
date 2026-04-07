import 'package:flutter/material.dart';

@immutable
class FroCellTheme extends ThemeExtension<FroCellTheme> {
  const FroCellTheme({
    required this.backgroundColor,
    required this.labelColor,
    required this.descriptionColor,
    required this.valueColor,
    required this.leadingIconColor,
    required this.arrowColor,
  });

  final Color backgroundColor;
  final Color labelColor;
  final Color descriptionColor;
  final Color valueColor;
  final Color leadingIconColor;
  final Color arrowColor;

  static FroCellTheme fallback(Brightness brightness) {
    if (brightness == Brightness.dark) {
      return const FroCellTheme(
        backgroundColor: Colors.transparent,
        labelColor: Color(0xFFF2F2F7),
        descriptionColor: Color(0xFF8E8E93),
        valueColor: Color(0xFFAEAEB2),
        leadingIconColor: Color(0xFF0A84FF),
        arrowColor: Color(0xFF636366),
      );
    }
    return const FroCellTheme(
      backgroundColor: Colors.transparent,
      labelColor: Color(0xFF323233),
      descriptionColor: Color(0xFF969799),
      valueColor: Color(0xFF969799),
      leadingIconColor: Color(0xFF1989FA),
      arrowColor: Color(0xFFC8C9CC),
    );
  }

  @override
  FroCellTheme copyWith({
    Color? backgroundColor,
    Color? labelColor,
    Color? descriptionColor,
    Color? valueColor,
    Color? leadingIconColor,
    Color? arrowColor,
  }) {
    return FroCellTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      labelColor: labelColor ?? this.labelColor,
      descriptionColor: descriptionColor ?? this.descriptionColor,
      valueColor: valueColor ?? this.valueColor,
      leadingIconColor: leadingIconColor ?? this.leadingIconColor,
      arrowColor: arrowColor ?? this.arrowColor,
    );
  }

  @override
  FroCellTheme lerp(covariant ThemeExtension<FroCellTheme>? other, double t) {
    if (other is! FroCellTheme) {
      return this;
    }
    return FroCellTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      labelColor: Color.lerp(labelColor, other.labelColor, t)!,
      descriptionColor: Color.lerp(
        descriptionColor,
        other.descriptionColor,
        t,
      )!,
      valueColor: Color.lerp(valueColor, other.valueColor, t)!,
      leadingIconColor: Color.lerp(
        leadingIconColor,
        other.leadingIconColor,
        t,
      )!,
      arrowColor: Color.lerp(arrowColor, other.arrowColor, t)!,
    );
  }
}
