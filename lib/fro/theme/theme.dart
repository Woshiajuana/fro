import 'package:flutter/material.dart';

import '../widgets/switch/switch_theme.dart';

@immutable
class FroTheme extends ThemeExtension<FroTheme> {
  const FroTheme({this.switchTheme = const FroSwitchThemeData()});

  final FroSwitchThemeData switchTheme;

  static FroTheme of(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.extension<FroTheme>() ?? FroTheme.fallback(theme.brightness);
  }

  static const FroTheme light = FroTheme(switchTheme: FroSwitchThemeData.light);

  static const FroTheme dark = FroTheme(switchTheme: FroSwitchThemeData.dark);

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
