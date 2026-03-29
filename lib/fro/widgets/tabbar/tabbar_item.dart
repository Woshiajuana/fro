import 'package:flutter/material.dart';

class FroTabbarItem {
  const FroTabbarItem({
    required this.icon,
    required this.activeIcon,
    required this.text,
    this.dot = false,
    this.badge,
  });

  final Widget icon;
  final Widget activeIcon;
  final String text;
  final bool dot;
  final String? badge;
}
