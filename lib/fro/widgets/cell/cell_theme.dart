import 'package:flutter/material.dart';

@immutable
class FroCellTheme extends ThemeExtension<FroCellTheme> {
  const FroCellTheme({
    required this.backgroundColor,
    required this.labelColor,
    required this.descriptionColor,
    required this.valueColor,
    required this.iconColor,
    required this.arrowColor,
  });

  final Color backgroundColor;
  final Color labelColor;
  final Color descriptionColor;
  final Color valueColor;
  final Color iconColor;
  final Color arrowColor;

  static FroCellTheme fallback(Brightness brightness) {
    if (brightness == Brightness.dark) {
      return const FroCellTheme(
        backgroundColor: Colors.transparent,
        labelColor: Color(0xFFF2F2F7),
        descriptionColor: Color(0xFF8E8E93),
        valueColor: Color(0xFFAEAEB2),
        iconColor: Color(0xFF0A84FF),
        arrowColor: Color(0xFF636366),
      );
    }
    return const FroCellTheme(
      backgroundColor: Colors.transparent,
      labelColor: Color(0xFF323233),
      descriptionColor: Color(0xFF969799),
      valueColor: Color(0xFF969799),
      iconColor: Color(0xFF1989FA),
      arrowColor: Color(0xFFC8C9CC),
    );
  }

  @override
  FroCellTheme copyWith({
    Color? backgroundColor,
    Color? labelColor,
    Color? descriptionColor,
    Color? valueColor,
    Color? iconColor,
    Color? arrowColor,
  }) {
    return FroCellTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      labelColor: labelColor ?? this.labelColor,
      descriptionColor: descriptionColor ?? this.descriptionColor,
      valueColor: valueColor ?? this.valueColor,
      iconColor: iconColor ?? this.iconColor,
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
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      arrowColor: Color.lerp(arrowColor, other.arrowColor, t)!,
    );
  }
}
