import 'package:flutter/material.dart';

import '../widgets/switch/switch_theme.dart';

@immutable
class FroTheme extends ThemeExtension<FroTheme> {
  const FroTheme({required this.switchTheme});

  final FroSwitchThemeData switchTheme;

  static FroTheme of(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.extension<FroTheme>() ?? FroTheme.fallback(theme.brightness);
  }

  static const FroTheme light = FroTheme(
    switchTheme: FroSwitchThemeData(
      activeColor: Color(0xFF1989FA),
      inactiveColor: Color(0xFFDCDCDC),
      loadingIndicatorColor: Color(0xFF1989FA),
    ),
  );

  static const FroTheme dark = FroTheme(
    switchTheme: FroSwitchThemeData(
      activeColor: Color(0xFF3B82F6),
      inactiveColor: Color(0xFF4B5563),
      loadingIndicatorColor: Color(0xFF3B82F6),
    ),
  );

  static FroTheme fallback(Brightness brightness) {
    return brightness == Brightness.dark ? dark : light;
  }

  @override
  FroTheme copyWith({FroSwitchThemeData? switchTheme}) {
    return FroTheme(switchTheme: switchTheme ?? this.switchTheme);
  }

  @override
  FroTheme lerp(covariant ThemeExtension<FroTheme>? other, double t) {
    if (other is! FroTheme) {
      return this;
    }
    return FroTheme(
      switchTheme: FroSwitchThemeData.lerp(switchTheme, other.switchTheme, t),
    );
  }
}
