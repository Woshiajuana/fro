import 'dart:ui';

import 'package:flutter/material.dart';

import '../../theme/theme.dart';

@immutable
class FroSwitchThemeData {
  const FroSwitchThemeData({
    this.activeColor,
    this.inactiveColor,
    this.loadingIndicatorColor,
    this.width,
    this.height,
    this.padding,
    this.thumbSize,
    this.animationDuration,
  }) : assert(width == null || width > 0),
       assert(height == null || height > 0),
       assert(padding == null || padding >= 0),
       assert(thumbSize == null || thumbSize > 0);

  final Color? activeColor;
  final Color? inactiveColor;
  final Color? loadingIndicatorColor;
  final double? width;
  final double? height;
  final double? padding;
  final double? thumbSize;
  final Duration? animationDuration;

  static const FroSwitchThemeData light = FroSwitchThemeData(
    activeColor: Color(0xFF1989FA),
    inactiveColor: Color(0xFFDCDCDC),
    loadingIndicatorColor: Color(0xFF1989FA),
    width: 52,
    height: 32,
    padding: 4,
    thumbSize: 24,
    animationDuration: Duration(milliseconds: 180),
  );

  static const FroSwitchThemeData dark = FroSwitchThemeData(
    activeColor: Color(0xFF3B82F6),
    inactiveColor: Color(0xFF4B5563),
    loadingIndicatorColor: Color(0xFF3B82F6),
    width: 52,
    height: 32,
    padding: 4,
    thumbSize: 24,
    animationDuration: Duration(milliseconds: 180),
  );

  static FroSwitchThemeData fallback(Brightness brightness) {
    return brightness == Brightness.dark ? dark : light;
  }

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
    FroSwitchThemeData? a,
    FroSwitchThemeData? b,
    double t,
  ) {
    if (identical(a, b)) {
      return a ?? const FroSwitchThemeData();
    }
    a ??= const FroSwitchThemeData();
    b ??= const FroSwitchThemeData();
    return FroSwitchThemeData(
      activeColor: Color.lerp(a.activeColor, b.activeColor, t),
      inactiveColor: Color.lerp(a.inactiveColor, b.inactiveColor, t),
      loadingIndicatorColor: Color.lerp(
        a.loadingIndicatorColor,
        b.loadingIndicatorColor,
        t,
      ),
      width: lerpDouble(a.width, b.width, t),
      height: lerpDouble(a.height, b.height, t),
      padding: lerpDouble(a.padding, b.padding, t),
      thumbSize: lerpDouble(a.thumbSize, b.thumbSize, t),
      animationDuration: _lerpDuration(
        a.animationDuration,
        b.animationDuration,
        t,
      ),
    );
  }

  static Duration? _lerpDuration(Duration? a, Duration? b, double t) {
    if (a == null && b == null) {
      return null;
    }
    final double begin = (a ?? Duration.zero).inMicroseconds.toDouble();
    final double end = (b ?? Duration.zero).inMicroseconds.toDouble();
    return Duration(microseconds: lerpDouble(begin, end, t)!.round());
  }

  @override
  int get hashCode => Object.hash(
    activeColor,
    inactiveColor,
    loadingIndicatorColor,
    width,
    height,
    padding,
    thumbSize,
    animationDuration,
  );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is FroSwitchThemeData &&
            activeColor == other.activeColor &&
            inactiveColor == other.inactiveColor &&
            loadingIndicatorColor == other.loadingIndicatorColor &&
            width == other.width &&
            height == other.height &&
            padding == other.padding &&
            thumbSize == other.thumbSize &&
            animationDuration == other.animationDuration;
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
