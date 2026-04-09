import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DemoRoute extends GoRoute {
  DemoRoute({
    this.icon,
    this.title,
    required super.path,
    required super.pageBuilder,
    super.name,
    super.routes,
  });

  final IconData? icon;
  final String? title;
}
