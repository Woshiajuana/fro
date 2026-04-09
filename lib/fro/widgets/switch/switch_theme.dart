import 'dart:ui';

import 'package:flutter/material.dart';

import '../../theme/theme.dart';

@immutable
class FroSwitchThemeData {
  const FroSwitchThemeData({
    required this.activeColor,
    required this.inactiveColor,
    required this.loadingIndicatorColor,
    this.width = 52,
    this.height = 32,
    this.padding = 4,
    this.thumbSize = 24,
    this.animationDuration = const Duration(milliseconds: 180),
  });

  final Color activeColor;
  final Color inactiveColor;
  final Color loadingIndicatorColor;
  final double width;
  final double height;
  final double padding;
  final double thumbSize;
  final Duration animationDuration;

  FroSwitchThemeData copyWith({
    Color? activeColor,
    Color? inactiveColor,
    Color? loadingIndicatorColor,
    double? width,
    double? height,
    double? padding,
    double? thumbSize,
    Duration? animationDuration,
  }) {
    return FroSwitchThemeData(
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
      loadingIndicatorColor:
          loadingIndicatorColor ?? this.loadingIndicatorColor,
      width: width ?? this.width,
      height: height ?? this.height,
      padding: padding ?? this.padding,
      thumbSize: thumbSize ?? this.thumbSize,
      animationDuration: animationDuration ?? this.animationDuration,
    );
  }

  static FroSwitchThemeData lerp(
    FroSwitchThemeData a,
    FroSwitchThemeData b,
    double t,
  ) {
    return FroSwitchThemeData(
      activeColor: Color.lerp(a.activeColor, b.activeColor, t)!,
      inactiveColor: Color.lerp(a.inactiveColor, b.inactiveColor, t)!,
      loadingIndicatorColor: Color.lerp(
        a.loadingIndicatorColor,
        b.loadingIndicatorColor,
        t,
      )!,
      width: lerpDouble(a.width, b.width, t)!,
      height: lerpDouble(a.height, b.height, t)!,
      padding: lerpDouble(a.padding, b.padding, t)!,
      thumbSize: lerpDouble(a.thumbSize, b.thumbSize, t)!,
      animationDuration: Duration(
        microseconds: lerpDouble(
          a.animationDuration.inMicroseconds.toDouble(),
          b.animationDuration.inMicroseconds.toDouble(),
          t,
        )!.round(),
      ),
    );
  }
}

class FroSwitchTheme extends InheritedWidget {
  const FroSwitchTheme({super.key, required this.data, required super.child});

  final FroSwitchThemeData data;

  static FroSwitchThemeData of(BuildContext context) {
    final FroSwitchTheme? switchTheme = context
        .dependOnInheritedWidgetOfExactType<FroSwitchTheme>();
    return switchTheme?.data ?? FroTheme.of(context).switchTheme;
  }

  @override
  bool updateShouldNotify(covariant FroSwitchTheme oldWidget) {
    return data != oldWidget.data;
  }
}
