import 'package:flutter/material.dart';

@immutable
class FroCellGroupTheme extends ThemeExtension<FroCellGroupTheme> {
  const FroCellGroupTheme({
    required this.backgroundColor,
    required this.borderColor,
    required this.dividerColor,
    required this.titleColor,
  });

  final Color backgroundColor;
  final Color borderColor;
  final Color dividerColor;
  final Color titleColor;

  static FroCellGroupTheme fallback(Brightness brightness) {
    if (brightness == Brightness.dark) {
      return const FroCellGroupTheme(
        backgroundColor: Color(0xFF1C1C1E),
        borderColor: Color(0xFF2C2C2E),
        dividerColor: Color(0xFF2C2C2E),
        titleColor: Color(0xFF8E8E93),
      );
    }
    return const FroCellGroupTheme(
      backgroundColor: Colors.white,
      borderColor: Color(0xFFEAEAEA),
      dividerColor: Color(0xFFEAEAEA),
      titleColor: Color(0xFF969799),
    );
  }

  @override
  FroCellGroupTheme copyWith({
    Color? backgroundColor,
    Color? borderColor,
    Color? dividerColor,
    Color? titleColor,
  }) {
    return FroCellGroupTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
      dividerColor: dividerColor ?? this.dividerColor,
      titleColor: titleColor ?? this.titleColor,
    );
  }

  @override
  FroCellGroupTheme lerp(
    covariant ThemeExtension<FroCellGroupTheme>? other,
    double t,
  ) {
    if (other is! FroCellGroupTheme) {
      return this;
    }
    return FroCellGroupTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      dividerColor: Color.lerp(dividerColor, other.dividerColor, t)!,
      titleColor: Color.lerp(titleColor, other.titleColor, t)!,
    );
  }
}
